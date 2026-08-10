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

W = H = 520
BG = (18, 18, 24)


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
        n = {"VEC3": 3, "SCALAR": 1}[acc["type"]]
        fmt = {5126: "f", 5125: "I", 5123: "H"}[acc["componentType"]]
        vals = struct.unpack_from(f"<{acc['count'] * n}{fmt}", buf, base)
        return [vals[k:k + n] for k in range(0, len(vals), n)] if n > 1 else list(vals)

    prims = []
    for prim in gltf["meshes"][0]["primitives"]:
        mat = gltf["materials"][prim["material"]]["pbrMetallicRoughness"]
        prims.append({
            "pos": read_accessor(prim["attributes"]["POSITION"]),
            "nrm": read_accessor(prim["attributes"]["NORMAL"]),
            "idx": read_accessor(prim["indices"]),
            "color": mat["baseColorFactor"][:3],
        })
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
            rgb = tuple(min(255, int(255 * (c ** 0.4545) * shade))
                        for c in prim["color"])
            _raster(frame, depth, scr, rgb)
    return frame


def _raster(frame, depth, scr, rgb):
    (x0, y0, z0), (x1, y1, z1), (x2, y2, z2) = scr
    area = (x1 - x0) * (y2 - y0) - (x2 - x0) * (y1 - y0)
    if abs(area) < 1e-9:
        return
    lo_x = max(0, int(min(x0, x1, x2)))
    hi_x = min(W - 1, int(max(x0, x1, x2)) + 1)
    lo_y = max(0, int(min(y0, y1, y2)))
    hi_y = min(H - 1, int(max(y0, y1, y2)) + 1)

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
            if z < depth[k]:
                depth[k] = z
                frame[k * 3:k * 3 + 3] = bytes(rgb)


# --------------------------------------------------------------------------
# PNG 出力
# --------------------------------------------------------------------------

def write_png(path: str, frame: bytearray) -> None:
    raw = b"".join(b"\x00" + bytes(frame[y * W * 3:(y + 1) * W * 3]) for y in range(H))

    def chunk(tag: bytes, body: bytes) -> bytes:
        return (struct.pack(">I", len(body)) + tag + body
                + struct.pack(">I", zlib.crc32(tag + body) & 0xFFFFFFFF))

    with open(path, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n")
        f.write(chunk(b"IHDR", struct.pack(">IIBBBBB", W, H, 8, 2, 0, 0, 0)))
        f.write(chunk(b"IDAT", zlib.compress(raw, 9)))
        f.write(chunk(b"IEND", b""))


CAMERAS = {
    "crystal": ((2.0, 1.5, 2.4), (0.0, 0.45, 0.0)),
    "terrain": ((2.3, 1.9, 2.6), (0.0, 0.15, 0.0)),
    "tree":    ((1.9, 1.4, 2.2), (0.0, 0.55, 0.0)),
    "planet":  ((2.1, 1.3, 2.4), (0.0, 0.0, 0.0)),
}


def main() -> int:
    here = os.path.dirname(os.path.abspath(__file__))
    src, dst = os.path.join(here, "models"), os.path.join(here, "preview")
    os.makedirs(dst, exist_ok=True)
    for name, (eye, target) in CAMERAS.items():
        glb = os.path.join(src, f"{name}.glb")
        if not os.path.exists(glb):
            print(f"skip {name}: {glb} がない（先に lowpoly.py を実行）")
            continue
        png = os.path.join(dst, f"{name}.png")
        write_png(png, render(read_glb(glb), eye, target))
        print(f"{png}  ({os.path.getsize(png)/1024:.1f} KB)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
