#!/usr/bin/env python3
"""PNG エンコードと、テクスチャを描くための小さなキャンバス。

顔テクスチャの生成（character.py）と、プレビュー描画（preview.py）の
両方から使う。外部ライブラリなし。

Canvas は内部を ss 倍の解像度で描いてから縮小する（スーパーサンプリング）ので、
目や眉の輪郭がジャギらない。
"""

from __future__ import annotations

import math
import struct
import zlib

Color = tuple[int, int, int]


def encode_png(w: int, h: int, rgb: bytes | bytearray) -> bytes:
    raw = b"".join(b"\x00" + bytes(rgb[y * w * 3:(y + 1) * w * 3]) for y in range(h))

    def chunk(tag: bytes, body: bytes) -> bytes:
        return (struct.pack(">I", len(body)) + tag + body
                + struct.pack(">I", zlib.crc32(tag + body) & 0xFFFFFFFF))

    return (b"\x89PNG\r\n\x1a\n"
            + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(bytes(raw), 9))
            + chunk(b"IEND", b""))


def write_png(path: str, w: int, h: int, rgb: bytes | bytearray) -> None:
    with open(path, "wb") as f:
        f.write(encode_png(w, h, rgb))


class Canvas:
    """座標は最終画像のピクセル単位（小数可）。内部は ss 倍で保持する。"""

    def __init__(self, w: int, h: int, ss: int = 3, bg: Color = (255, 255, 255)):
        self.w, self.h, self.ss = w, h, ss
        self.iw, self.ih = w * ss, h * ss
        self.px = bytearray(bytes(bg) * (self.iw * self.ih))

    # -- 図形 ------------------------------------------------------------
    def rect(self, x0: float, y0: float, x1: float, y1: float, color: Color,
             alpha: float = 1.0) -> None:
        self._scan(x0, y0, x1, y1, color, lambda px, py: True, alpha)

    def ellipse(self, cx: float, cy: float, rx: float, ry: float, color: Color,
                rot: float = 0.0, alpha: float = 1.0) -> None:
        c, s = math.cos(-rot), math.sin(-rot)

        def inside(px: float, py: float) -> bool:
            dx, dy = px - cx, py - cy
            u, v = dx * c - dy * s, dx * s + dy * c
            return (u / rx) ** 2 + (v / ry) ** 2 <= 1.0

        r = max(rx, ry)
        self._scan(cx - r, cy - r, cx + r, cy + r, color, inside, alpha)

    def soft_ellipse(self, cx: float, cy: float, rx: float, ry: float, color: Color,
                     alpha: float = 0.5, layers: int = 7) -> None:
        """中心ほど濃い楕円。頬の赤みや影のグラデーションに。"""
        for k in range(layers, 0, -1):
            f = k / layers
            self.ellipse(cx, cy, rx * f, ry * f, color, alpha=alpha / layers)

    def capsule(self, x0: float, y0: float, x1: float, y1: float, r: float,
                color: Color, alpha: float = 1.0) -> None:
        """太さのある線分（両端は丸）。眉・まつ毛・口の弧に使う。"""
        dx, dy = x1 - x0, y1 - y0
        ln2 = dx * dx + dy * dy

        def inside(px: float, py: float) -> bool:
            if ln2 < 1e-9:
                t = 0.0
            else:
                t = max(0.0, min(1.0, ((px - x0) * dx + (py - y0) * dy) / ln2))
            ex, ey = px - (x0 + t * dx), py - (y0 + t * dy)
            return ex * ex + ey * ey <= r * r

        self._scan(min(x0, x1) - r, min(y0, y1) - r,
                   max(x0, x1) + r, max(y0, y1) + r, color, inside, alpha)

    def arc(self, cx: float, cy: float, rx: float, ry: float, a0: float, a1: float,
            width: float, color: Color, steps: int = 24, alpha: float = 1.0) -> None:
        """楕円弧を capsule のつなぎで描く。口や頬のラインに。"""
        prev = None
        for k in range(steps + 1):
            a = a0 + (a1 - a0) * k / steps
            p = (cx + rx * math.cos(a), cy + ry * math.sin(a))
            if prev:
                self.capsule(prev[0], prev[1], p[0], p[1], width / 2, color, alpha)
            prev = p

    def spiral(self, cx: float, cy: float, r0: float, r1: float, turns: float,
               width: float, color: Color, steps: int = 96,
               start: float = 0.0) -> None:
        """アルキメデスの渦巻き。ぐるぐる目に使う。"""
        prev = None
        for k in range(steps + 1):
            f = k / steps
            a = start + turns * 2 * math.pi * f
            r = r0 + (r1 - r0) * f
            p = (cx + r * math.cos(a), cy + r * math.sin(a))
            if prev:
                self.capsule(prev[0], prev[1], p[0], p[1], width / 2, color)
            prev = p

    def teardrop(self, cx: float, cy: float, r: float, length: float,
                 color: Color, steps: int = 18) -> None:
        """上が丸く下が尖った形。地図のピンに。cy は丸い側の中心。"""
        for k in range(steps + 1):
            f = k / steps
            rr = r * (1 - f) ** 0.75
            if rr > 1e-6:                # 先端は半径 0 になるので描かない
                self.ellipse(cx, cy + length * f, rr, rr, color)

    # -- 出力 ------------------------------------------------------------
    def _scan(self, x0, y0, x1, y1, color, inside, alpha=1.0) -> None:
        ss = self.ss
        lo_x = max(0, int(x0 * ss))
        hi_x = min(self.iw - 1, int(math.ceil(x1 * ss)))
        lo_y = max(0, int(y0 * ss))
        hi_y = min(self.ih - 1, int(math.ceil(y1 * ss)))
        if hi_x < lo_x or hi_y < lo_y:
            return
        rgb = bytes(color)
        opaque = alpha >= 0.999
        for py in range(lo_y, hi_y + 1):
            fy = (py + 0.5) / ss
            row = py * self.iw
            for px in range(lo_x, hi_x + 1):
                if not inside((px + 0.5) / ss, fy):
                    continue
                k = (row + px) * 3
                if opaque:
                    self.px[k:k + 3] = rgb
                else:
                    for c in range(3):
                        self.px[k + c] = int(self.px[k + c] * (1 - alpha)
                                             + color[c] * alpha)

    def resolve(self) -> bytearray:
        """ss 倍の内部バッファを箱フィルタで縮小して RGB バイト列にする。"""
        ss, out = self.ss, bytearray(self.w * self.h * 3)
        n = ss * ss
        for y in range(self.h):
            for x in range(self.w):
                r = g = b = 0
                for sy in range(ss):
                    base = ((y * ss + sy) * self.iw + x * ss) * 3
                    for sx in range(ss):
                        k = base + sx * 3
                        r += self.px[k]
                        g += self.px[k + 1]
                        b += self.px[k + 2]
                k = (y * self.w + x) * 3
                out[k] = r // n
                out[k + 1] = g // n
                out[k + 2] = b // n
        return out

    def to_png(self) -> bytes:
        return encode_png(self.w, self.h, self.resolve())
