#!/usr/bin/env python3
"""生成したメッシュの自己診断。

AE の Advanced 3D は裏面を描画しないので、面の向きが揃っていないと
モデルが「中が透けて見える」状態になる。glTF バリデータは巻き方向を
見てくれないため、ここで幾何的に検算する。

  python3 lowpoly/check.py
"""

from __future__ import annotations

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from lowpoly import MODELS, _normal


def analyse(part) -> dict:
    """1 パーツを調べる。退化三角形は書き出し時に捨てられるので除外して見る。"""
    tris, degenerate = [], 0
    for a, b, c in part.tris:
        if _normal(part.verts[a], part.verts[b], part.verts[c]) is None:
            degenerate += 1
        else:
            tris.append((a, b, c))

    # 有向辺を数える。向きが揃っていれば、共有辺は必ず逆向きの対になる。
    # 頂点は面ごとに複製されている（フラットシェーディングのため）ので、
    # 添字ではなく座標で突き合わせないと全部の辺が「縁」に見えてしまう
    def key(i: int) -> tuple:
        return tuple(round(v, 6) for v in part.verts[i])

    directed: dict[tuple, int] = {}
    for a, b, c in tris:
        for i, j in ((a, b), (b, c), (c, a)):
            e = (key(i), key(j))
            directed[e] = directed.get(e, 0) + 1

    flipped = 0        # 同じ向きで 2 回現れる辺 = 隣り合う面が裏返っている
    boundary = 0       # 対になる辺がない = 開いた縁
    for (a, b), n in directed.items():
        if n > 1:
            flipped += n - 1
        if (b, a) not in directed:
            boundary += 1

    volume = 0.0
    for a, b, c in tris:
        (ax, ay, az), (bx, by, bz), (cx, cy, cz) = (part.verts[a], part.verts[b],
                                                    part.verts[c])
        volume += (ax * (by * cz - bz * cy) + ay * (bz * cx - bx * cz)
                   + az * (bx * cy - by * cx))
    return {"tris": len(tris), "degenerate": degenerate, "flipped": flipped,
            "closed": boundary == 0, "volume": volume / 6.0}


def outward_ratio(part, center) -> float:
    """面法線がモデル中心から外を向いている割合。開いたシェル用の目安。"""
    out = total = 0
    for a, b, c in part.tris:
        va, vb, vc = part.verts[a], part.verts[b], part.verts[c]
        n = _normal(va, vb, vc)
        if n is None:
            continue
        total += 1
        d = ((va[0] + vb[0] + vc[0]) / 3 - center[0],
             (va[1] + vb[1] + vc[1]) / 3 - center[1],
             (va[2] + vb[2] + vc[2]) / 3 - center[2])
        if n[0] * d[0] + n[1] * d[1] + n[2] * d[2] > 0:
            out += 1
    return out / total if total else 1.0


def centroid(parts) -> tuple[float, float, float]:
    pts = [v for p in parts for v in p.verts]
    n = len(pts) or 1
    return tuple(sum(v[i] for v in pts) / n for i in range(3))


def check_model(label: str, parts) -> int:
    center = centroid(parts)
    failures = 0
    for part in parts:
        a = analyse(part)
        notes = []
        if a["degenerate"]:
            notes.append(f"退化三角形 {a['degenerate']}")
        if a["flipped"]:
            notes.append(f"巻き方向の不一致 {a['flipped']} 辺")
        if a["closed"]:
            kind = "閉"
            if a["volume"] <= 0:
                notes.append(f"面が内向き (体積 {a['volume']:+.4f})")
        else:
            kind = "開"
            ratio = outward_ratio(part, center)
            if ratio < 0.6:
                notes.append(f"外を向く面が {ratio:.0%} しかない")

        failures += bool(notes)
        print(f"  {part.name:<8} {kind} {a['tris']:>4} tris  "
              + ("NG " + " / ".join(notes) if notes else "OK"))
    return failures


def main() -> int:
    failures = 0
    for name, (builder, label) in MODELS.items():
        print(f"{label} ({name})")
        failures += check_model(label, builder())

    try:
        import character
    except ImportError:
        character = None
    if character:
        print(f"キャラクター ({character.SPEC['name']})")
        failures += check_model("character", character.build())

    print("\n" + ("すべて OK" if not failures else f"{failures} パーツに問題"))
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
