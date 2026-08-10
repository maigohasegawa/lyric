#!/usr/bin/env python3
"""ローポリ 3D モデル (.glb) ジェネレータ — After Effects 直接読み込み用。

標準ライブラリのみ。Blender も numpy も不要。
glTF 2.0 バイナリ (.glb) を直接書き出すので、AE の
「ファイル > 読み込み」でそのまま配置できる（レンダラーは Advanced 3D になる）。

  python3 lowpoly/lowpoly.py            # models/ に全モデルを書き出し
  python3 lowpoly/lowpoly.py crystal    # 個別に書き出し
"""

from __future__ import annotations

import json
import math
import os
import struct
import sys

# --------------------------------------------------------------------------
# ジオメトリの基本形
# --------------------------------------------------------------------------

Vec = tuple[float, float, float]


class Part:
    """1 マテリアル分のメッシュ。頂点と三角形インデックスを持つ。"""

    def __init__(self, color: tuple[float, float, float], metallic=0.0, roughness=0.8,
                 name="part", alpha=1.0, texture: bytes | None = None,
                 double_sided=False):
        self.verts: list[Vec] = []
        self.uvs: list[tuple[float, float]] = []
        self.tris: list[tuple[int, int, int]] = []
        self.color = color
        self.metallic = metallic
        self.roughness = roughness
        self.alpha = alpha
        self.name = name
        self.texture = texture          # PNG バイト列。GLB に同梱される
        # 布や継ぎあてのような厚みのない板は両面にする。片面のままだと
        # AE の Advanced 3D では裏から見たときに消えてしまう
        self.double_sided = double_sided

    def add_vert(self, v: Vec, uv: tuple[float, float] = (0.0, 0.0)) -> int:
        self.verts.append(v)
        self.uvs.append(uv)
        return len(self.verts) - 1

    def add_tri(self, a: int, b: int, c: int) -> None:
        self.tris.append((a, b, c))

    def add_face(self, idx: list[int]) -> None:
        """凸多角形を三角形に扇状分割して追加。"""
        for i in range(1, len(idx) - 1):
            self.add_tri(idx[0], idx[i], idx[i + 1])

    def transform(self, scale=1.0, offset=(0.0, 0.0, 0.0), rot_y=0.0,
                  tilt=0.0, roll=0.0) -> "Part":
        """拡大 → X 軸(tilt) → Z 軸(roll) → Y 軸(rot_y) の順に回して平行移動。"""
        cy, sy = math.cos(rot_y), math.sin(rot_y)
        ct, st = math.cos(tilt), math.sin(tilt)
        cr, sr = math.cos(roll), math.sin(roll)
        out = []
        for x, y, z in self.verts:
            x, y, z = x * scale, y * scale, z * scale
            y, z = y * ct - z * st, y * st + z * ct       # X 軸まわり
            x, y = x * cr - y * sr, x * sr + y * cr       # Z 軸まわり
            x, z = x * cy - z * sy, x * sy + z * cy       # Y 軸まわり
            out.append((x + offset[0], y + offset[1], z + offset[2]))
        self.verts = out
        return self

    def copy(self) -> "Part":
        clone = Part(self.color, self.metallic, self.roughness, self.name,
                     self.alpha, self.texture, self.double_sided)
        clone.verts = list(self.verts)
        clone.uvs = list(self.uvs)
        clone.tris = list(self.tris)
        return clone

    def scale_xyz(self, sx: float, sy: float, sz: float) -> "Part":
        self.verts = [(x * sx, y * sy, z * sz) for x, y, z in self.verts]
        return self

    def mirror_x(self) -> "Part":
        """X 反転。面が裏返るので巻き方向も入れ替える。"""
        self.verts = [(-x, y, z) for x, y, z in self.verts]
        self.tris = [(a, c, b) for a, b, c in self.tris]
        return self

    def merge(self, other: "Part") -> None:
        """別 Part のジオメトリを取り込む（マテリアルは自分のものを使う）。"""
        base = len(self.verts)
        self.verts.extend(other.verts)
        self.uvs.extend(other.uvs)
        self.tris.extend([(a + base, b + base, c + base) for a, b, c in other.tris])

    def flat_shaded(self) -> tuple[list[float], list[float], list[float], list[int]]:
        """面ごとに頂点を複製し、面法線を付ける（＝ローポリ特有のカクカク陰影）。"""
        pos: list[float] = []
        nrm: list[float] = []
        uv: list[float] = []
        idx: list[int] = []
        for a, b, c in self.tris:
            va, vb, vc = self.verts[a], self.verts[b], self.verts[c]
            n = _normal(va, vb, vc)
            if n is None:               # 面積ゼロの退化三角形は捨てる
                continue                # （法線が長さ 0 になり glTF 的に不正）
            base = len(pos) // 3
            for k in (a, b, c):
                pos.extend(self.verts[k])
                nrm.extend(n)
                uv.extend(self.uvs[k])
            idx.extend((base, base + 1, base + 2))
        return pos, nrm, uv, idx


def _normal(a: Vec, b: Vec, c: Vec) -> Vec | None:
    ux, uy, uz = b[0] - a[0], b[1] - a[1], b[2] - a[2]
    vx, vy, vz = c[0] - a[0], c[1] - a[1], c[2] - a[2]
    nx, ny, nz = uy * vz - uz * vy, uz * vx - ux * vz, ux * vy - uy * vx
    ln = math.sqrt(nx * nx + ny * ny + nz * nz)
    if ln < 1e-12:
        return None
    return (nx / ln, ny / ln, nz / ln)


# --------------------------------------------------------------------------
# GLB 書き出し
# --------------------------------------------------------------------------

def write_glb(path: str, parts: list[Part], model_name="model") -> None:
    buffer = bytearray()
    accessors: list[dict] = []
    buffer_views: list[dict] = []
    materials: list[dict] = []
    primitives: list[dict] = []

    def push(data: bytes, target: int) -> int:
        while len(buffer) % 4:          # glTF はビューの 4 バイト境界を要求
            buffer.append(0)
        offset = len(buffer)
        buffer.extend(data)
        buffer_views.append({"buffer": 0, "byteOffset": offset,
                             "byteLength": len(data), "target": target})
        return len(buffer_views) - 1

    images: list[dict] = []
    textures: list[dict] = []

    for part in parts:
        pos, nrm, uv, idx = part.flat_shaded()
        if not idx:
            continue
        count = len(pos) // 3

        pos_view = push(struct.pack(f"<{len(pos)}f", *pos), 34962)
        nrm_view = push(struct.pack(f"<{len(nrm)}f", *nrm), 34962)

        xs, ys, zs = pos[0::3], pos[1::3], pos[2::3]
        accessors.append({"bufferView": pos_view, "componentType": 5126,
                          "count": count, "type": "VEC3",
                          "min": [min(xs), min(ys), min(zs)],
                          "max": [max(xs), max(ys), max(zs)]})
        accessors.append({"bufferView": nrm_view, "componentType": 5126,
                          "count": count, "type": "VEC3"})
        attributes = {"POSITION": len(accessors) - 2, "NORMAL": len(accessors) - 1}

        if part.texture is not None:    # UV はテクスチャを持つパーツにだけ付ける
            uv_view = push(struct.pack(f"<{len(uv)}f", *uv), 34962)
            accessors.append({"bufferView": uv_view, "componentType": 5126,
                              "count": count, "type": "VEC2"})
            attributes["TEXCOORD_0"] = len(accessors) - 1

        idx_view = push(struct.pack(f"<{len(idx)}I", *idx), 34963)
        accessors.append({"bufferView": idx_view, "componentType": 5125,
                          "count": len(idx), "type": "SCALAR"})

        pbr = {
            "baseColorFactor": [*part.color, part.alpha],
            "metallicFactor": part.metallic,
            "roughnessFactor": part.roughness,
        }
        if part.texture is not None:
            # 画像も GLB のバイナリチャンクに同梱する（外部ファイルを作らない）
            img_view = push(part.texture, 0)
            buffer_views[img_view].pop("target")   # 画像のビューに target は付けない
            images.append({"bufferView": img_view, "mimeType": "image/png"})
            textures.append({"source": len(images) - 1, "sampler": 0})
            pbr["baseColorTexture"] = {"index": len(textures) - 1}

        mat = {"name": part.name, "doubleSided": part.double_sided,
               "pbrMetallicRoughness": pbr}
        if part.alpha < 1.0:
            mat["alphaMode"] = "BLEND"
        materials.append(mat)

        primitives.append({"attributes": attributes, "indices": len(accessors) - 1,
                           "material": len(materials) - 1})

    gltf = {
        "asset": {"version": "2.0", "generator": "lowpoly.py"},
        "scene": 0,
        "scenes": [{"nodes": [0]}],
        "nodes": [{"mesh": 0, "name": model_name}],
        "meshes": [{"name": model_name, "primitives": primitives}],
        "materials": materials,
        "accessors": accessors,
        "bufferViews": buffer_views,
        "buffers": [{"byteLength": len(buffer)}],
    }
    if textures:
        gltf["images"] = images
        gltf["textures"] = textures
        # 10497 = REPEAT, 9729 = LINEAR, 9987 = LINEAR_MIPMAP_LINEAR
        gltf["samplers"] = [{"magFilter": 9729, "minFilter": 9987,
                             "wrapS": 10497, "wrapT": 10497}]

    json_chunk = json.dumps(gltf, separators=(",", ":")).encode("utf-8")
    json_chunk += b" " * (-len(json_chunk) % 4)
    bin_chunk = bytes(buffer) + b"\x00" * (-len(buffer) % 4)

    total = 12 + 8 + len(json_chunk) + 8 + len(bin_chunk)
    with open(path, "wb") as f:
        f.write(struct.pack("<III", 0x46546C67, 2, total))
        f.write(struct.pack("<II", len(json_chunk), 0x4E4F534A))
        f.write(json_chunk)
        f.write(struct.pack("<II", len(bin_chunk), 0x004E4942))
        f.write(bin_chunk)


# --------------------------------------------------------------------------
# プリミティブ
# --------------------------------------------------------------------------

def prism(part: Part, sides: int, radius: float, y0: float, y1: float,
          taper=1.0, twist=0.0, cap_bottom=True, cap_top=True, phase=0.0) -> None:
    """角柱 / 円錐台。taper は y1 側の半径比（0 なら尖らせて円錐にする）、
    twist は y1 側リングの回転、phase は y0 側リングの開始角。

    別の形状を上に積むときは、下側の phase に相手の twist を渡して角度を
    合わせること。ずれているとリング状の隙間が空く。

    面の巻き方向は glTF の規約どおり「外から見て反時計回り」に揃える
    （揃っていないと AE の Advanced 3D で裏面が抜けて中が透けて見える）。
    """
    ring0 = [part.add_vert((radius * math.cos(2 * math.pi * i / sides + phase), y0,
                            radius * math.sin(2 * math.pi * i / sides + phase)))
             for i in range(sides)]
    pointed = taper <= 1e-9
    if pointed:
        apex = part.add_vert((0.0, y1, 0.0))
        ring1 = [apex] * sides
    else:
        r = radius * taper
        ring1 = [part.add_vert(
            (r * math.cos(2 * math.pi * i / sides + phase + twist), y1,
             r * math.sin(2 * math.pi * i / sides + phase + twist)))
            for i in range(sides)]

    lo, hi = (ring0, ring1) if y1 > y0 else (ring1, ring0)
    for i in range(sides):
        j = (i + 1) % sides
        # [下i, 上i, 上j, 下j] の順で外向き。尖端側は 2 頂点が重なり三角形になる
        part.add_face(_dedup([lo[i], hi[i], hi[j], lo[j]]))

    # フタの法線: 下側の面は -Y（リングそのまま）、上側の面は +Y（逆順）
    if cap_bottom:
        part.add_face(list(reversed(ring0)) if y0 > y1 else list(ring0))
    if cap_top and not pointed:
        part.add_face(list(ring1) if y1 < y0 else list(reversed(ring1)))


def _dedup(idx: list[int]) -> list[int]:
    return [v for k, v in enumerate(idx) if v != idx[k - 1]]


def cone(part: Part, sides: int, radius: float, y0: float, y1: float, cap=True,
         phase=0.0) -> None:
    prism(part, sides, radius, y0, y1, taper=0.0, cap_bottom=cap, cap_top=False,
          phase=phase)


def loft(part: Part, sections: list[tuple[float, float, float]], sides: int = 8,
         cap_bottom=True, cap_top=True, twist=0.0) -> None:
    """楕円断面を下から積み上げたチューブ。胴・腕・脚・髪の房などに使う。

    sections は [(y, x半径, z半径), ...] を y の小さい順で。半径 0 の断面を
    端に置けば尖らせられる（重なった頂点は退化三角形として捨てられる）。
    """
    rings: list[list[int]] = []
    for level, (y, rx, rz) in enumerate(sections):
        phase = twist * level
        rings.append([part.add_vert((rx * math.cos(2 * math.pi * i / sides + phase), y,
                                     rz * math.sin(2 * math.pi * i / sides + phase)))
                      for i in range(sides)])

    for lo, hi in zip(rings, rings[1:]):
        for i in range(sides):
            j = (i + 1) % sides
            part.add_face(_dedup([lo[i], hi[i], hi[j], lo[j]]))

    if cap_bottom:
        part.add_face(list(rings[0]))                 # 下面は -Y 向き
    if cap_top:
        part.add_face(list(reversed(rings[-1])))      # 上面は +Y 向き


def ring(part: Part, sides: int, r_inner: float, r_outer: float,
         y0: float, y1: float) -> None:
    """穴あきの平たいリング（土星の環など）。内壁は軸を向く。"""
    lo, hi = min(y0, y1), max(y0, y1)
    o_lo, o_hi, i_lo, i_hi = [], [], [], []
    for k in range(sides):
        a = 2 * math.pi * k / sides
        cos_a, sin_a = math.cos(a), math.sin(a)
        o_lo.append(part.add_vert((r_outer * cos_a, lo, r_outer * sin_a)))
        o_hi.append(part.add_vert((r_outer * cos_a, hi, r_outer * sin_a)))
        i_lo.append(part.add_vert((r_inner * cos_a, lo, r_inner * sin_a)))
        i_hi.append(part.add_vert((r_inner * cos_a, hi, r_inner * sin_a)))

    for k in range(sides):
        m = (k + 1) % sides
        part.add_face([o_lo[k], o_hi[k], o_hi[m], o_lo[m]])   # 外壁 (外向き)
        part.add_face([i_lo[m], i_hi[m], i_hi[k], i_lo[k]])   # 内壁 (軸向き)
        part.add_face([o_hi[k], i_hi[k], i_hi[m], o_hi[m]])   # 上面 (+Y)
        part.add_face([o_lo[m], i_lo[m], i_lo[k], o_lo[k]])   # 下面 (-Y)


def icosphere(part: Part, subdiv: int, radius: float, center=(0.0, 0.0, 0.0),
              jitter=0.0, seed=1) -> None:
    """正二十面体を分割して球に。jitter>0 で頂点をずらすと岩っぽくなる。"""
    t = (1 + math.sqrt(5)) / 2
    base = [(-1, t, 0), (1, t, 0), (-1, -t, 0), (1, -t, 0),
            (0, -1, t), (0, 1, t), (0, -1, -t), (0, 1, -t),
            (t, 0, -1), (t, 0, 1), (-t, 0, -1), (-t, 0, 1)]
    faces = [(0, 11, 5), (0, 5, 1), (0, 1, 7), (0, 7, 10), (0, 10, 11),
             (1, 5, 9), (5, 11, 4), (11, 10, 2), (10, 7, 6), (7, 1, 8),
             (3, 9, 4), (3, 4, 2), (3, 2, 6), (3, 6, 8), (3, 8, 9),
             (4, 9, 5), (2, 4, 11), (6, 2, 10), (8, 6, 7), (9, 8, 1)]
    pts = [_norm3(p) for p in base]

    for _ in range(subdiv):
        cache: dict[tuple[int, int], int] = {}
        new_faces = []

        def mid(a: int, b: int) -> int:
            key = (min(a, b), max(a, b))
            if key not in cache:
                pa, pb = pts[a], pts[b]
                pts.append(_norm3(((pa[0] + pb[0]) / 2, (pa[1] + pb[1]) / 2,
                                   (pa[2] + pb[2]) / 2)))
                cache[key] = len(pts) - 1
            return cache[key]

        for a, b, c in faces:
            ab, bc, ca = mid(a, b), mid(b, c), mid(c, a)
            new_faces += [(a, ab, ca), (b, bc, ab), (c, ca, bc), (ab, bc, ca)]
        faces = new_faces

    idx = []
    for i, (x, y, z) in enumerate(pts):
        r = radius * (1.0 + jitter * (_rand(i, seed) - 0.5))
        idx.append(part.add_vert((center[0] + x * r, center[1] + y * r,
                                  center[2] + z * r)))
    for a, b, c in faces:
        part.add_tri(idx[a], idx[b], idx[c])


def box(part: Part, x0: float, y0: float, z0: float,
        x1: float, y1: float, z1: float) -> None:
    """軸に沿った直方体。靴・手・小物向け。"""
    def v(x, y, z):
        return part.add_vert((x, y, z))

    part.add_face([v(x1, y0, z1), v(x1, y0, z0), v(x1, y1, z0), v(x1, y1, z1)])  # +X
    part.add_face([v(x0, y0, z0), v(x0, y0, z1), v(x0, y1, z1), v(x0, y1, z0)])  # -X
    part.add_face([v(x0, y1, z1), v(x1, y1, z1), v(x1, y1, z0), v(x0, y1, z0)])  # +Y
    part.add_face([v(x0, y0, z0), v(x1, y0, z0), v(x1, y0, z1), v(x0, y0, z1)])  # -Y
    part.add_face([v(x0, y0, z1), v(x1, y0, z1), v(x1, y1, z1), v(x0, y1, z1)])  # +Z
    part.add_face([v(x1, y0, z0), v(x0, y0, z0), v(x0, y1, z0), v(x1, y1, z0)])  # -Z


def face_plate(part: Part, center: Vec, radii: Vec, yaw_span: float,
               pitch_hi: float, pitch_lo: float, cols: int = 5, rows: int = 5,
               bulge: float = 1.015) -> None:
    """楕円体（頭）の前面に沿う格子状の板。UV は 0..1 に張る。

    顔をテクスチャで描くための土台。頭の表面よりわずかに外に出して
    Z ファイティングを避ける。glTF の UV は左上原点なので v は下向き。
    """
    grid: list[list[int]] = []
    for r in range(rows + 1):
        fv = r / rows
        pitch = pitch_hi + (pitch_lo - pitch_hi) * fv
        row = []
        for c in range(cols + 1):
            fu = c / cols
            yaw = (fu * 2 - 1) * yaw_span
            d = (math.sin(yaw) * math.cos(pitch), math.sin(pitch),
                 math.cos(yaw) * math.cos(pitch))
            row.append(part.add_vert(
                (center[0] + d[0] * radii[0] * bulge,
                 center[1] + d[1] * radii[1] * bulge,
                 center[2] + d[2] * radii[2] * bulge), (fu, fv)))
        grid.append(row)

    for r in range(rows):
        for c in range(cols):
            part.add_face([grid[r][c], grid[r + 1][c],
                           grid[r + 1][c + 1], grid[r][c + 1]])


def panel(part: Part, center: Vec, u: Vec, v: Vec, hu: float, hv: float) -> None:
    """center を中心に、u/v が張る平面上の四角形。法線は u×v の向き。

    継ぎあての布や、ぶら下げた洗濯物のような薄いものに使う。
    """
    def at(su: float, sv: float) -> int:
        return part.add_vert((center[0] + u[0] * su * hu + v[0] * sv * hv,
                              center[1] + u[1] * su * hu + v[1] * sv * hv,
                              center[2] + u[2] * su * hu + v[2] * sv * hv))

    part.add_face([at(-1, -1), at(1, -1), at(1, 1), at(-1, 1)])


def filter_tris(part: Part, keep) -> None:
    """三角形の重心を見て残すものを選ぶ。髪から顔の窓を抜くのに使う。"""
    kept = []
    for a, b, c in part.tris:
        va, vb, vc = part.verts[a], part.verts[b], part.verts[c]
        centroid = ((va[0] + vb[0] + vc[0]) / 3, (va[1] + vb[1] + vc[1]) / 3,
                    (va[2] + vb[2] + vc[2]) / 3)
        if keep(centroid):
            kept.append((a, b, c))
    part.tris = kept


def _norm3(p: Vec) -> Vec:
    ln = math.sqrt(p[0] ** 2 + p[1] ** 2 + p[2] ** 2) or 1.0
    return (p[0] / ln, p[1] / ln, p[2] / ln)


def _rand(*key: int) -> float:
    """決定論的な擬似乱数 [0,1)。同じ seed なら毎回同じ形になる。"""
    h = 0x811C9DC5
    for k in key:
        h ^= (k + 0x9E3779B9) & 0xFFFFFFFF
        h = (h * 0x01000193) & 0xFFFFFFFF
        h ^= h >> 15
    return ((h >> 8) & 0xFFFFFF) / 0x1000000


def _value_noise(x: float, z: float, seed: int) -> float:
    ix, iz = math.floor(x), math.floor(z)
    fx, fz = x - ix, z - iz
    sx = fx * fx * (3 - 2 * fx)          # smoothstep
    sz = fz * fz * (3 - 2 * fz)
    c00 = _rand(ix, iz, seed)
    c10 = _rand(ix + 1, iz, seed)
    c01 = _rand(ix, iz + 1, seed)
    c11 = _rand(ix + 1, iz + 1, seed)
    return (c00 * (1 - sx) + c10 * sx) * (1 - sz) + (c01 * (1 - sx) + c11 * sx) * sz


# --------------------------------------------------------------------------
# モデル定義
# --------------------------------------------------------------------------

def make_crystal() -> list[Part]:
    """六角柱＋両錐のクリスタル。中央に大きい 1 本＋周りに小さい 3 本。"""
    body = Part((0.29, 0.76, 0.84), metallic=0.1, roughness=0.15,
                name="crystal", alpha=0.85)
    glow = Part((0.94, 0.25, 0.59), metallic=0.0, roughness=0.35, name="core")

    def shard(target: Part, r: float, h: float, tip: float,
              offset: Vec, yaw: float, tilt: float) -> None:
        p = Part(target.color, name="tmp")
        # 上下とも錐で塞ぐので、柱の側にフタを付けると内部に面が残る
        prism(p, 6, r, 0.0, h, taper=0.82, twist=0.12,
              cap_bottom=False, cap_top=False)
        cone(p, 6, r * 0.82, h, h + tip, cap=False, phase=0.12)   # 上の尖り
        cone(p, 6, r, 0.0, -r * 0.5, cap=False)       # 下の尖り
        target.merge(p.transform(offset=offset, rot_y=yaw, tilt=tilt))

    shard(body, 0.24, 0.85, 0.45, (0.00, 0.00, 0.00), 0.0, 0.05)
    shard(body, 0.13, 0.42, 0.26, (0.34, -0.05, 0.12), 0.9, 0.30)
    shard(body, 0.10, 0.30, 0.20, (-0.30, -0.06, 0.05), 2.1, -0.34)
    shard(glow, 0.07, 0.30, 0.16, (-0.05, 0.02, 0.30), 1.6, 0.22)
    return [body, glow]


def make_terrain(size=18, seed=7) -> list[Part]:
    """ローポリの山。高さで岩／草／雪の 3 マテリアルに振り分ける。"""
    rock = Part((0.36, 0.35, 0.42), roughness=0.95, name="rock")
    grass = Part((0.18, 0.46, 0.36), roughness=0.9, name="grass")
    snow = Part((0.93, 0.95, 0.98), roughness=0.55, name="snow")

    step = 2.0 / size
    heights = []
    for iz in range(size + 1):
        row = []
        for ix in range(size + 1):
            x, z = ix * step - 1.0, iz * step - 1.0
            h = (_value_noise(x * 2.0, z * 2.0, seed) * 0.55
                 + _value_noise(x * 4.5, z * 4.5, seed + 1) * 0.22
                 + _value_noise(x * 9.0, z * 9.0, seed + 2) * 0.09)
            falloff = max(0.0, 1.0 - math.sqrt(x * x + z * z) / 1.25)
            row.append(h * falloff * 1.15)
        heights.append(row)

    for iz in range(size):
        for ix in range(size):
            quad = [(ix, iz), (ix + 1, iz), (ix + 1, iz + 1), (ix, iz + 1)]
            pts = [(gx * step - 1.0, heights[gz][gx], gz * step - 1.0)
                   for gx, gz in quad]
            avg = sum(p[1] for p in pts) / 4
            slope = max(p[1] for p in pts) - min(p[1] for p in pts)
            target = snow if avg > 0.52 else (rock if (avg > 0.28 or slope > 0.11) else grass)
            idx = [target.add_vert(p) for p in reversed(pts)]   # 上向き (+Y) の法線に
            target.add_face(idx)
    return [rock, grass, snow]


def make_tree() -> list[Part]:
    """幹＋3 段の円錐という定番のローポリ針葉樹。"""
    trunk = Part((0.35, 0.22, 0.15), roughness=0.95, name="trunk")
    leaf = Part((0.15, 0.44, 0.30), roughness=0.85, name="leaves")

    prism(trunk, 5, 0.075, 0.0, 0.42, taper=0.75)
    for i, (y, r, h) in enumerate([(0.30, 0.40, 0.42), (0.58, 0.31, 0.38),
                                   (0.84, 0.20, 0.34)]):
        p = Part(leaf.color, name="tmp")
        cone(p, 7, r, 0.0, h)
        leaf.merge(p.transform(offset=(0.0, y, 0.0), rot_y=i * 0.5))
    return [trunk, leaf]


def make_planet() -> list[Part]:
    """ファセット球（惑星 / 岩 / 抽象オブジェの土台に）。"""
    body = Part((0.07, 0.76, 0.84), metallic=0.25, roughness=0.4, name="planet")
    icosphere(body, subdiv=1, radius=0.6, jitter=0.10, seed=3)
    halo = Part((0.95, 0.72, 0.02), metallic=0.6, roughness=0.3, name="ring")
    ring(halo, 14, r_inner=0.78, r_outer=1.05, y0=-0.018, y1=0.018)
    halo.transform(tilt=0.22)
    return [body, halo]


MODELS = {
    "crystal": (make_crystal, "低ポリ クリスタル"),
    "terrain": (make_terrain, "低ポリ 山"),
    "tree": (make_tree, "低ポリ 木"),
    "planet": (make_planet, "低ポリ 惑星"),
}


def main(argv: list[str]) -> int:
    out_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "models")
    os.makedirs(out_dir, exist_ok=True)
    names = argv[1:] or list(MODELS)
    for name in names:
        if name not in MODELS:
            print(f"unknown model: {name} (available: {', '.join(MODELS)})")
            return 1
        builder, label = MODELS[name]
        parts = builder()
        path = os.path.join(out_dir, f"{name}.glb")
        write_glb(path, parts, model_name=name)
        tris = sum(len(p.tris) for p in parts)
        print(f"{label:<20} {path}  ({tris} tris / {len(parts)} materials, "
              f"{os.path.getsize(path)/1024:.1f} KB)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
