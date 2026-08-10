#!/usr/bin/env python3
"""生成したメッシュの自己診断。

AE の Advanced 3D は裏面を描画しないので、面の向きが揃っていないと
モデルが「中が透けて見える」状態になる。glTF バリデータは巻き方向を
見てくれないため、ここで幾何的に検算する。

  python3 lowpoly/check.py
"""

import math
import sys

from lowpoly import MODELS, _normal


def signed_volume(part) -> float:
    """閉じたメッシュの符号付き体積。外向き (CCW) に揃っていれば正。"""
    total = 0.0
    for a, b, c in part.tris:
        (ax, ay, az), (bx, by, bz), (cx, cy, cz) = (part.verts[a], part.verts[b],
                                                    part.verts[c])
        total += (ax * (by * cz - bz * cy)
                  + ay * (bz * cx - bx * cz)
                  + az * (bx * cy - by * cx))
    return total / 6.0


def main() -> int:
    failures = 0
    for name, (builder, label) in MODELS.items():
        for part in builder():
            degenerate = sum(1 for a, b, c in part.tris
                             if _normal(part.verts[a], part.verts[b],
                                        part.verts[c]) is None)
            normals = [n for n in (_normal(part.verts[a], part.verts[b], part.verts[c])
                                   for a, b, c in part.tris) if n]
            vol = signed_volume(part)
            notes = []

            if degenerate:
                notes.append(f"退化三角形 {degenerate} 個")

            if name == "terrain":
                # 開いた地形なので体積では判定できない。全面が上を向くのが正
                downward = sum(1 for n in normals if n[1] <= 0)
                if downward:
                    notes.append(f"下向きの面 {downward} 個")
            elif vol <= 0:
                notes.append(f"面が内向き (体積 {vol:+.4f})")

            status = "NG " + " / ".join(notes) if notes else "OK"
            if notes:
                failures += 1
            print(f"{label:<16} {part.name:<10} {len(part.tris):>4} tris  "
                  f"vol={vol:+.4f}  {status}")

    print("\n" + ("すべて OK" if not failures else f"{failures} 件の問題"))
    return 1 if failures else 0


if __name__ == "__main__":
    sys.path.insert(0, __file__.rsplit("/", 1)[0])
    raise SystemExit(main())
