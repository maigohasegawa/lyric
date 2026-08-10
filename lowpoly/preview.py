#!/usr/bin/env python3
"""書き出した .glb を読み戻して PNG にレンダリングする確認用ツール。

外部ライブラリなしのソフトウェアラスタライザ（Zバッファ＋フラットシェーディング）。
書き出し側とは独立に GLB を読むので、ファイルが本当に正しく書けているかの
往復チェックも兼ねる。

  python3 lowpoly/preview.py            # models/*.glb -> preview/*.png
"""

from __future__ import annotations

import json
import math
import os
import struct
import sys
import zlib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from png import write_png

W = H = 520
BG = (18, 18, 24)


def decode_png(data: bytes) -> tuple[int, int, bytearray]:
    """8bit RGB・非インターレースの PNG を復号する（このリポジトリが出す形式）。"""
    pos, idat, w, h = 8, bytearray(), 0, 0
    while pos < len(data):
        length = struct.unpack_from(">I", data, pos)[0]
        tag = data[pos + 4:pos + 8]
        body = data[pos + 8:pos + 8 + length]
        if tag == b"IHDR":
            w, h, depth, color = struct.unpack_from(">IIBB", body, 0)
            assert depth == 8 and color == 2, "8bit RGB のみ対応"
        elif tag == b"IDAT":
            idat += body
        pos += 12 + length

    raw = zlib.decompress(bytes(idat))
    out = bytearray(w * h * 3)
    stride = w * 3
    for y in range(h):
        f = raw[y * (stride + 1)]
        line = raw[y * (stride + 1) + 1: (y + 1) * (stride + 1)]
        for i in range(stride):
            a = out[y * stride + i - 3] if i >= 3 else 0
            b = out[(y - 1) * stride + i] if y > 0 else 0
            c = out[(y - 1) * stride + i - 3] if (y > 0 and i >= 3) else 0
            x = line[i]
            if f == 1:
                x += a
            elif f == 2:
                x += b
            elif f == 3:
                x += (a + b) // 2
            elif f == 4:
                p = a + b - c
                pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
                x += a if (pa <= pb and pa <= pc) else (b if pb <= pc else c)
            out[y * stride + i] = x & 0xFF
    return w, h, out


# --------------------------------------------------------------------------
# GLB 読み込み
# --------------------------------------------------------------------------

def read_glb(path: str) -> list[dict]:
    with open(path, "rb") as f:
        data = f.read()
    magic, version, _ = struct.unpack_from("<III", data, 0)
    assert magic == 0x46546C67 and version == 2, "GLB ヘッダが不正"

    chunks: dict[int, bytes] = {}
    off = 12
    while off < len(data):
        length, ctype = struct.unpack_from("<II", data, off)
        chunks[ctype] = data[off + 8: off + 8 + length]
        off += 8 + length
    gltf = json.loads(chunks[0x4E4F534A])
    buf = chunks[0x004E4942]

    def read_accessor(i: int) -> list:
        acc = gltf["accessors"][i]
        view = gltf["bufferViews"][acc["bufferView"]]
        base = view.get("byteOffset", 0) + acc.get("byteOffset", 0)
        n = {"VEC3": 3, "VEC2": 2, "SCALAR": 1}[acc["type"]]
        fmt = {5126: "f", 5125: "I", 5123: "H"}[acc["componentType"]]
        vals = struct.unpack_from(f"<{acc['count'] * n}{fmt}", buf, base)
        return [vals[k:k + n] for k in range(0, len(vals), n)] if n > 1 else list(vals)

    def read_image(tex_index: int):
        src = gltf["textures"][tex_index]["source"]
        view = gltf["bufferViews"][gltf["images"][src]["bufferView"]]
        off = view.get("byteOffset", 0)
        return decode_png(buf[off: off + view["byteLength"]])

    prims = []
    for prim in gltf["meshes"][0]["primitives"]:
        mat = gltf["materials"][prim["material"]]["pbrMetallicRoughness"]
        entry = {
            "pos": read_accessor(prim["attributes"]["POSITION"]),
            "nrm": read_accessor(prim["attributes"]["NORMAL"]),
            "idx": read_accessor(prim["indices"]),
            "color": mat["baseColorFactor"][:3],
            "uv": None,
            "tex": None,
        }
        if "baseColorTexture" in mat:
            entry["uv"] = read_accessor(prim["attributes"]["TEXCOORD_0"])
            entry["tex"] = read_image(mat["baseColorTexture"]["index"])
        prims.append(entry)
    return prims


# --------------------------------------------------------------------------
# レンダリング
# --------------------------------------------------------------------------

def look_at(eye, target, up=(0.0, 1.0, 0.0)):
    f = _unit(_sub(target, eye))
    s = _unit(_cross(f, up))
    u = _cross(s, f)
    return s, u, f


def _sub(a, b): return (a[0] - b[0], a[1] - b[1], a[2] - b[2])
def _dot(a, b): return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
def _cross(a, b): return (a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2],
                          a[0] * b[1] - a[1] * b[0])


def _unit(v):
    ln = math.sqrt(_dot(v, v)) or 1.0
    return (v[0] / ln, v[1] / ln, v[2] / ln)


def render(prims: list[dict], eye, target) -> bytearray:
    s, u, f = look_at(eye, target)
    focal = W / (2 * math.tan(math.radians(32) / 2))
    light = _unit((-0.45, 0.8, 0.6))

    frame = bytearray(BG * (W * H))
    depth = [float("inf")] * (W * H)

    to_linear = [(v / 255) ** 2.2 for v in range(256)]

    for prim in prims:
        for t in range(0, len(prim["idx"]), 3):
            tri = [prim["pos"][prim["idx"][t + k]] for k in range(3)]
            n = prim["nrm"][prim["idx"][t]]

            # ビュー空間へ
            view = []
            for v in tri:
                d = _sub(v, eye)
                view.append((_dot(d, s), _dot(d, u), _dot(d, f)))
            if min(p[2] for p in view) <= 0.05:
                continue
            if _dot(n, _sub(tri[0], eye)) >= 0:      # AE と同じく裏面はカリング
                continue

            scr = [(W / 2 + p[0] / p[2] * focal, H / 2 - p[1] / p[2] * focal, p[2])
                   for p in view]

            lam = max(0.0, _dot(n, light))
            shade = 0.22 + 0.78 * lam                # 環境光 + ディフューズ

            if prim["tex"] is None:
                rgb = tuple(min(255, int(255 * (c ** 0.4545) * shade))
                            for c in prim["color"])
                _raster(frame, depth, scr, rgb)
            else:
                # フラットシェーディングなので陰影は面ごとに一定。
                # sRGB 8bit → リニア → 陰影 → sRGB の変換表を面ごとに作れば
                # ピクセルごとの pow を避けられる
                lut = bytes(min(255, int(255 * (to_linear[v] * shade) ** 0.4545))
                            for v in range(256))
                uvs = [prim["uv"][prim["idx"][t + k]] for k in range(3)]
                _raster(frame, depth, scr, None, uvs, prim["tex"], lut)
    return frame


def _raster(frame, depth, scr, rgb, uvs=None, tex=None, lut=None):
    (x0, y0, z0), (x1, y1, z1), (x2, y2, z2) = scr
    area = (x1 - x0) * (y2 - y0) - (x2 - x0) * (y1 - y0)
    if abs(area) < 1e-9:
        return
    lo_x = max(0, int(min(x0, x1, x2)))
    hi_x = min(W - 1, int(max(x0, x1, x2)) + 1)
    lo_y = max(0, int(min(y0, y1, y2)))
    hi_y = min(H - 1, int(max(y0, y1, y2)) + 1)
    flat = bytes(rgb) if rgb else None
    if tex is not None:
        tw, th, texels = tex
        iz0, iz1, iz2 = 1 / z0, 1 / z1, 1 / z2

    for py in range(lo_y, hi_y + 1):
        cy = py + 0.5
        for px in range(lo_x, hi_x + 1):
            cx = px + 0.5
            w0 = ((x1 - cx) * (y2 - cy) - (x2 - cx) * (y1 - cy)) / area
            w1 = ((x2 - cx) * (y0 - cy) - (x0 - cx) * (y2 - cy)) / area
            w2 = 1.0 - w0 - w1
            if w0 < 0 or w1 < 0 or w2 < 0:
                continue
            z = w0 * z0 + w1 * z1 + w2 * z2
            k = py * W + px
            if z >= depth[k]:
                continue
            depth[k] = z
            if flat is not None:
                frame[k * 3:k * 3 + 3] = flat
                continue
            # UV は遠近補正して引く（1/z で重みを付け直す）
            iz = w0 * iz0 + w1 * iz1 + w2 * iz2
            uu = (w0 * uvs[0][0] * iz0 + w1 * uvs[1][0] * iz1
                  + w2 * uvs[2][0] * iz2) / iz
            vv = (w0 * uvs[0][1] * iz0 + w1 * uvs[1][1] * iz1
                  + w2 * uvs[2][1] * iz2) / iz
            tx = min(tw - 1, max(0, int(uu * tw)))
            ty = min(th - 1, max(0, int(vv * th)))
            j = (ty * tw + tx) * 3
            frame[k * 3] = lut[texels[j]]
            frame[k * 3 + 1] = lut[texels[j + 1]]
            frame[k * 3 + 2] = lut[texels[j + 2]]


CAMERAS = {
    "crystal": ((2.0, 1.5, 2.4), (0.0, 0.45, 0.0)),
    "terrain": ((2.3, 1.9, 2.6), (0.0, 0.15, 0.0)),
    "tree":    ((1.9, 1.4, 2.2), (0.0, 0.55, 0.0)),
    "planet":  ((2.1, 1.3, 2.4), (0.0, 0.0, 0.0)),
    "heki":    ((0.55, 0.85, 2.55), (0.0, 0.52, 0.0)),
}

# キャラクターは正面・斜め・横・背面を並べて確認したい
TURNAROUND = [0.0, 0.65, math.pi / 2, math.pi]


def orbit(eye, target, angle: float):
    dx, dz = eye[0] - target[0], eye[2] - target[2]
    c, s = math.cos(angle), math.sin(angle)
    return (target[0] + dx * c - dz * s, eye[1], target[2] + dx * s + dz * c)


def main(argv: list[str]) -> int:
    here = os.path.dirname(os.path.abspath(__file__))
    src, dst = os.path.join(here, "models"), os.path.join(here, "preview")
    os.makedirs(dst, exist_ok=True)
    names = argv[1:] or list(CAMERAS)
    for name in names:
        eye, target = CAMERAS[name]
        glb = os.path.join(src, f"{name}.glb")
        if not os.path.exists(glb):
            print(f"skip {name}: {glb} がない（先に lowpoly.py / character.py を実行）")
            continue
        prims = read_glb(glb)
        angles = TURNAROUND if name == "heki" else [0.0]
        for i, a in enumerate(angles):
            suffix = f"-{i}" if len(angles) > 1 else ""
            png = os.path.join(dst, f"{name}{suffix}.png")
            write_png(png, W, H, render(prims, orbit(eye, target, a), target))
            print(f"{png}  ({os.path.getsize(png)/1024:.1f} KB)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
