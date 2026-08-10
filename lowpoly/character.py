#!/usr/bin/env python3
"""真宵ヘキ — ローポリ 3D モデル（5頭身 / Aポーズ / 顔はテクスチャ）。

設定資料より:
  ぐるぐる目、冷え症で青白い肌、ぱっつん前髪のボブ、頭頂に青い点列、
  白シャツ＋ダークな上着＋くすんだ臙脂のネクタイ、継ぎだらけで
  引きずるほどダボダボの青灰パンツ（足は隠れる）、
  そして道中でもらい続けた結果の巨大な荷物。

シルエットと配色は SPEC の数値だけで決まる。

  python3 lowpoly/character.py           # models/heki.glb を書き出し
"""

from __future__ import annotations

import math
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from lowpoly import (Part, box, face_plate, filter_tris, icosphere, loft, panel,
                     prism, write_glb)
from png import Canvas

# --------------------------------------------------------------------------
# キャラクター定義
# --------------------------------------------------------------------------

SPEC = {
    "name": "heki",
    "height": 1.0,
    "heads": 5.0,           # 資料は 4.5 頭身寄りだが、指定どおり 5 で組む

    # 配色（sRGB 表記。マテリアル用にリニアへ変換される）
    "skin":       "#eff2f5",   # 冷え症で青白い
    "skin_dark":  "#d5dee6",
    "hair":       "#3c434b",
    "eye_pale":   "#dfe9f0",   # ぐるぐる目の下地
    "eye_line":   "#3f4a55",   # 渦の線
    "lash":       "#2b3138",
    "mouth":      "#4c525a",
    "pin":        "#df4a44",   # 鼻の位置にある赤いマップピン
    "dots":       "#3f7fd8",   # 頭頂に並ぶ青い点
    "shirt":      "#fbfcfd",
    "collar_sh":  "#cfe0ea",   # 首もとの淡い青
    "tie":        "#a06b76",
    "jacket":     "#2f3543",
    "pants":      "#6f8096",

    # 体型（head_h = 身長 / 頭身 を 1 とした比率）
    "head_rx": 0.44, "head_ry": 0.50, "head_rz": 0.46,
    "neck_r": 0.15,
    "shoulder_half": 0.50,
    "chest_half": 0.40,  "chest_depth": 0.30,
    "waist_half": 0.36,  "waist_depth": 0.28,
    "hip_half": 0.42,    "hip_depth": 0.32,
    "arm_r": 0.135, "wrist_r": 0.095,

    # ポーズ
    "arm_splay": 0.26,
    "arm_forward": 0.06,

    # 髪（ボブ）
    "hair_flare": 1.34,     # 毛先の広がり
    "hair_bottom": -1.05,   # 毛先の高さ（head_ry 比、頭の中心から）
    "bang_line": 0.14,      # 前髪の下端（head_ry 比）
    "face_window": 0.62,    # 顔の窓の幅（head_rx 比）
    "head_dots": 5,

    # 服
    "jacket_bottom": 0.46,  # 上着の裾（地面〜あご を 1 とした高さ）
    "pants_flare": 2.15,    # 裾の広がり
}

# 体のランドマーク（地面〜あごまでを 1 とした比率）
LANDMARKS = {
    "hem": 0.020, "knee": 0.290, "crotch": 0.520, "hip": 0.565,
    "waist": 0.680, "chest": 0.820, "shoulder": 0.915, "neck": 0.945,
}

# パンツの継ぎあて: (高さ比, 角度, 横半幅, 縦半幅, 色)
PATCHES = [
    (0.44, 0.5, 0.22, 0.18, "#cfc0a4"), (0.30, 2.4, 0.20, 0.22, "#b9a488"),
    (0.19, 0.9, 0.19, 0.16, "#e4d05a"), (0.36, 4.0, 0.17, 0.19, "#e6b6bc"),
    (0.12, 3.2, 0.22, 0.15, "#b8bcc2"), (0.25, 5.4, 0.18, 0.17, "#a8bf8a"),
    (0.47, 3.6, 0.16, 0.16, "#e6b6bc"), (0.08, 1.7, 0.20, 0.14, "#cfc0a4"),
]


def srgb(hex_str: str) -> tuple[float, float, float]:
    """#RRGGBB → リニア色（glTF の baseColorFactor はリニア）。"""
    v = hex_str.lstrip("#")
    return tuple((int(v[i:i + 2], 16) / 255) ** 2.2 for i in (0, 2, 4))


def rgb(hex_str: str) -> tuple[int, int, int]:
    """#RRGGBB → 0-255（テクスチャは sRGB のまま入れる）。"""
    v = hex_str.lstrip("#")
    return tuple(int(v[i:i + 2], 16) for i in (0, 2, 4))


# --------------------------------------------------------------------------
# 顔テクスチャ
# --------------------------------------------------------------------------

def face_texture(spec: dict, size: int = 256) -> bytes:
    """ぐるぐる目・小さい口・鼻の位置の赤いピン。

    サイズは 2 のべき乗にしておく（ミップマップと REPEAT ラップの前提）。
    周囲は肌色のままなので、頭の地肌との継ぎ目が出ない。
    """
    c = Canvas(size, size, ss=3, bg=rgb(spec["skin"]))
    s = size

    eye_y = 0.47 * s
    eye_dx = 0.200 * s
    eye_r = 0.150 * s

    for side in (-1, 1):
        cx = s / 2 + side * eye_dx
        c.ellipse(cx, eye_y, eye_r, eye_r, rgb(spec["lash"]))
        c.ellipse(cx, eye_y, eye_r * 0.88, eye_r * 0.88, rgb(spec["eye_pale"]))
        c.spiral(cx, eye_y, eye_r * 0.80, eye_r * 0.05, turns=2.15,
                 width=0.020 * s, color=rgb(spec["eye_line"]))

    # 鼻の位置に赤いマップピン、その下に小さい口
    c.teardrop(s / 2, eye_y + 0.135 * s, 0.028 * s, 0.062 * s, rgb(spec["pin"]))
    c.capsule(s / 2 - 0.035 * s, eye_y + 0.270 * s,
              s / 2 + 0.035 * s, eye_y + 0.270 * s, 0.009 * s, rgb(spec["mouth"]))

    return c.to_png()


# --------------------------------------------------------------------------
# 体
# --------------------------------------------------------------------------

def build(spec: dict = SPEC) -> list[Part]:
    h = spec["height"]
    u = h / spec["heads"]           # head_h。体格の基準単位
    chin = h - u
    y = {k: v * chin for k, v in LANDMARKS.items()}

    head_c = (0.0, chin + u * 0.5, 0.0)
    radii = (spec["head_rx"] * u, spec["head_ry"] * u, spec["head_rz"] * u)

    skin = Part(srgb(spec["skin"]), roughness=0.9, name="skin")
    hair = Part(srgb(spec["hair"]), roughness=0.75, name="hair")
    dots = Part(srgb(spec["dots"]), roughness=0.45, name="dots")
    shirt = Part(srgb(spec["shirt"]), roughness=0.9, name="shirt")
    collar = Part(srgb(spec["collar_sh"]), roughness=0.9, name="collar",
                  double_sided=True)
    tie = Part(srgb(spec["tie"]), roughness=0.85, name="tie")
    jacket = Part(srgb(spec["jacket"]), roughness=0.9, name="jacket")
    pants = Part(srgb(spec["pants"]), roughness=0.95, name="pants")

    # -- 頭と首 ---------------------------------------------------------
    dome = Part(skin.color, name="tmp")
    icosphere(dome, subdiv=1, radius=1.0)
    skin.merge(dome.scale_xyz(*radii).transform(offset=head_c))
    loft(skin, [(y["shoulder"] - 0.02 * u, spec["neck_r"] * u * 1.5,
                 spec["neck_r"] * u * 1.4),
                (y["neck"], spec["neck_r"] * u, spec["neck_r"] * u),
                (chin + 0.02 * u, spec["neck_r"] * u * 0.95,
                 spec["neck_r"] * u * 0.95)], sides=8)

    face = Part((1.0, 1.0, 1.0), roughness=0.9, name="face",
                texture=face_texture(spec))
    face_plate(face, head_c, radii, yaw_span=math.radians(40),
               pitch_hi=math.radians(30), pitch_lo=math.radians(-40),
               cols=5, rows=5, bulge=1.015)

    _build_hair(hair, dots, spec, head_c, radii, u)

    # -- シャツ（上着の前を開けて見せる）--------------------------------
    loft(shirt, [(y["hip"], spec["hip_half"] * u * 0.94,
                  spec["hip_depth"] * u * 0.94),
                 (y["waist"], spec["waist_half"] * u * 0.94,
                  spec["waist_depth"] * u * 0.94),
                 (y["chest"], spec["chest_half"] * u * 0.94,
                  spec["chest_depth"] * u * 0.94),
                 (y["shoulder"], spec["shoulder_half"] * u * 0.86,
                  spec["chest_depth"] * u * 0.88),
                 (y["shoulder"] + 0.04 * u, spec["shoulder_half"] * u * 0.60,
                  spec["chest_depth"] * u * 0.62)], sides=10)

    # 開いた襟。左右に 1 枚ずつ、外へ倒した板で表現する
    for side in (1, -1):
        panel(collar, (side * 0.10 * u, y["shoulder"] - 0.03 * u,
                       spec["chest_depth"] * u * 0.84),
              (0.30 * side, 0.95, 0.0), (0.94, -0.30 * side, 0.14),
              0.11 * u, 0.07 * u)
    # 首もとの淡い青
    loft(collar, [(y["neck"] - 0.02 * u, spec["neck_r"] * u * 1.18,
                   spec["neck_r"] * u * 1.16),
                  (chin - 0.04 * u, spec["neck_r"] * u * 1.12,
                   spec["neck_r"] * u * 1.10)], sides=8, cap_bottom=False,
         cap_top=False)

    # ネクタイ
    tie_top = y["shoulder"] - 0.06 * u
    loft(tie, [(y["chest"] - 0.34 * u, 0.055 * u, 0.020 * u),
               (y["chest"] - 0.10 * u, 0.060 * u, 0.022 * u),
               (tie_top - 0.10 * u, 0.036 * u, 0.018 * u),
               (tie_top, 0.048 * u, 0.024 * u)], sides=6)
    tie.transform(offset=(0.0, 0.0, spec["chest_depth"] * u * 0.82))

    # -- 上着（前身頃を抜いて開襟にする）--------------------------------
    loft(jacket, [(y["hem"] + spec["jacket_bottom"] * chin,
                   spec["hip_half"] * u * 1.30, spec["hip_depth"] * u * 1.22),
                  (y["hip"], spec["hip_half"] * u * 1.24,
                   spec["hip_depth"] * u * 1.18),
                  (y["waist"], spec["waist_half"] * u * 1.24,
                   spec["waist_depth"] * u * 1.20),
                  (y["chest"], spec["chest_half"] * u * 1.22,
                   spec["chest_depth"] * u * 1.18),
                  (y["shoulder"], spec["shoulder_half"] * u * 1.10,
                   spec["chest_depth"] * u * 1.10),
                  (y["shoulder"] + 0.05 * u, spec["shoulder_half"] * u * 0.74,
                   spec["chest_depth"] * u * 0.78)],
         sides=12, cap_bottom=False)

    def not_front_opening(centroid) -> bool:
        x, _, z = centroid
        return not (z > 0 and abs(x) < spec["chest_half"] * u * 0.80)

    filter_tris(jacket, not_front_opening)

    # -- 腕（Aポーズ。袖が長く手先だけのぞく）---------------------------
    up_len, lo_len = 0.74 * u, 0.72 * u
    hand = Part(skin.color, name="tmp")
    loft(hand, [(-(up_len + lo_len) - 0.20 * u, spec["wrist_r"] * u * 0.78,
                 spec["wrist_r"] * u * 1.0),
                (-(up_len + lo_len) + 0.02 * u, spec["wrist_r"] * u * 0.98,
                 spec["wrist_r"] * u * 1.1)], sides=6)
    sleeve = Part(jacket.color, name="tmp")
    loft(sleeve, [(-(up_len + lo_len) + 0.02 * u, spec["wrist_r"] * u * 1.30,
                   spec["wrist_r"] * u * 1.30),
                  (-up_len, spec["arm_r"] * u * 1.12, spec["arm_r"] * u * 1.12),
                  (0.02 * u, spec["arm_r"] * u * 1.34, spec["arm_r"] * u * 1.34),
                  (0.12 * u, spec["arm_r"] * u * 1.10, spec["arm_r"] * u * 1.10)],
         sides=7)

    shoulder_x = spec["shoulder_half"] * u * 0.92
    for side in (1, -1):
        hd, sl = hand.copy(), sleeve.copy()
        if side < 0:
            hd.mirror_x()
            sl.mirror_x()
        kw = {"offset": (side * shoulder_x, y["shoulder"], 0.0),
              "roll": side * spec["arm_splay"], "tilt": spec["arm_forward"]}
        skin.merge(hd.transform(**kw))
        jacket.merge(sl.transform(**kw))

    # -- パンツ（裾を引きずるほどダボダボ。足は隠れる）------------------
    patches = _build_pants(pants, spec, u, y)

    parts = [skin, face, hair, dots, shirt, collar, tie, jacket, pants]
    parts += patches
    parts += _build_luggage(spec, u, y)
    return [p for p in parts if p.tris]


def _build_hair(hair: Part, dots: Part, spec: dict, head_c, radii, u: float) -> None:
    """ぱっつん前髪のボブ。頭を覆う釣鐘を作ってから顔の窓を抜く。"""
    rx, ry, rz = radii
    # (高さ, x 半径倍率, z 半径倍率) を上から下へ
    profile = [
        (1.03, 0.26, 0.26), (0.86, 0.74, 0.76), (0.55, 1.00, 1.02),
        (0.15, 1.14, 1.16), (-0.35, 1.24, 1.24),
        (spec["hair_bottom"] + 0.18, spec["hair_flare"] * 0.97,
         spec["hair_flare"] * 0.96),
        (spec["hair_bottom"], spec["hair_flare"], spec["hair_flare"] * 0.98),
    ]
    bell = Part(hair.color, name="tmp")
    loft(bell, [(head_c[1] + ry * fy, rx * fx, rz * fz)
                for fy, fx, fz in reversed(profile)], sides=14, cap_bottom=False)

    bang_y = head_c[1] + ry * spec["bang_line"]
    window_x = rx * spec["face_window"]

    def keeps(centroid) -> bool:
        """前髪の下端より下、かつ正面の狭い範囲だけ顔を出す。横の毛は残す。"""
        x, y_, z = centroid
        return not (z > rz * 0.15 and abs(x) < window_x and y_ < bang_y)

    filter_tris(bell, keeps)
    hair.merge(bell)

    # 頭頂に並ぶ青い点（地図の経路のような並び）
    n = spec["head_dots"]
    for i in range(n):
        t = (i / (n - 1)) * 2 - 1
        yaw = t * math.radians(38)
        pitch = math.radians(52) - abs(t) * math.radians(7)
        d = (math.sin(yaw) * math.cos(pitch), math.sin(pitch),
             math.cos(yaw) * math.cos(pitch))
        dot = Part(dots.color, name="tmp")
        icosphere(dot, subdiv=0, radius=0.055 * u)
        dots.merge(dot.transform(offset=(
            head_c[0] + d[0] * rx * 1.16, head_c[1] + d[1] * ry * 1.12,
            head_c[2] + d[2] * rz * 1.16)))


def _build_pants(pants: Part, spec: dict, u: float, y: dict) -> list[Part]:
    """裾が広がって地面でたまるダボダボのパンツ。継ぎあて付き。"""
    leg_x = spec["hip_half"] * u * 0.72
    hem = y["hem"]
    flare = spec["pants_flare"]

    # 腰まわりはひと続き
    loft(pants, [(y["crotch"] - 0.02 * u, spec["hip_half"] * u * 1.16,
                  spec["hip_depth"] * u * 1.12),
                 (y["hip"], spec["hip_half"] * u * 1.14,
                  spec["hip_depth"] * u * 1.10),
                 (y["waist"] + 0.04 * u, spec["waist_half"] * u * 1.10,
                  spec["waist_depth"] * u * 1.08)], sides=10, cap_top=False)

    r_thigh = spec["hip_half"] * u * 0.62
    for side in (1, -1):
        leg = Part(pants.color, name="tmp")
        loft(leg, [(hem - 0.012 * u, r_thigh * flare * 1.10, r_thigh * flare * 1.34),
                   (hem + 0.10 * u, r_thigh * flare * 0.94, r_thigh * flare * 1.02),
                   (y["knee"], r_thigh * 1.80, r_thigh * 1.80),
                   (y["crotch"] + 0.02 * u, r_thigh * 1.55, r_thigh * 1.55)],
             sides=9, cap_top=False)
        pants.merge(leg.transform(offset=(side * leg_x, 0.0, 0.0)))

    # 継ぎあて。脚の表面に沿って少し浮かせた板を貼る。
    # 色ごとに Part をまとめる（pants に merge すると色が落ちてしまう）
    span = y["crotch"] - hem
    by_color: dict[str, Part] = {}
    for fy, ang, w, hh, color in PATCHES:
        patch = by_color.setdefault(
            color, Part(srgb(color), roughness=0.95, name=f"patch_{color[1:]}",
                        double_sided=True))
        py = hem + span * fy
        f = (py - hem) / span
        r = (r_thigh * flare * 0.98) * (1 - f) + (r_thigh * 1.58) * f
        for side in (1, -1):
            a = ang if side > 0 else math.pi - ang
            panel(patch, (side * leg_x + math.cos(a) * r * 1.04, py,
                          math.sin(a) * r * 1.04),
                  (0.0, 1.0, 0.0), (-math.sin(a), 0.0, math.cos(a)),
                  hh * u, w * u)
    return list(by_color.values())


def _build_luggage(spec: dict, u: float, y: dict) -> list[Part]:
    """背負い荷物。個々の小物は拾いきれないので、シルエットに効くものを選ぶ。"""
    parts: list[Part] = []

    def new(color: str, name: str, rough=0.9, metal=0.0, flat=False) -> Part:
        p = Part(srgb(color), metallic=metal, roughness=rough, name=name,
                 double_sided=flat)
        parts.append(p)
        return p

    pack = new("#e8a33c", "pack")
    strap = new("#6b4b32", "straps", rough=0.85, flat=True)
    roll = new("#e05fa0", "roll")
    books = new("#f2f2ee", "books")
    solar = new("#2c3f66", "solar", rough=0.35, metal=0.3)
    speaker = new("#4a4a5a", "speaker", rough=0.6)
    cushion = new("#9db06a", "cushion")
    phones = new("#33363d", "phones", rough=0.5)
    cloths = new("#dcc9a8", "cloths", flat=True)
    compass = new("#d5dbe0", "compass", rough=0.3, metal=0.5)
    rods = new("#4d5560", "rods", rough=0.5)

    # 荷物は本人より大きい。以降の小物はこのパックの寸法を基準に置く
    pw, ph, pd = 1.28 * u, 1.08 * u, 0.94 * u       # 半径（横・縦・奥行）
    cx_, cy_, cz_ = 0.0, y["chest"] + 0.04 * u, -spec["chest_depth"] * u - pd * 0.78

    def at(fx: float, fy: float, fz: float) -> tuple[float, float, float]:
        """パックの大きさを 1 とした相対座標を絶対座標に直す。"""
        return (cx_ + fx * pw, cy_ + fy * ph, cz_ + fz * pd)

    # 本体は塊を 3 つ重ねて、縫い合わせたような不整形にする
    for i, (fx, fy, fz, r) in enumerate([(0.00, -0.05, 0.00, 0.94),
                                         (-0.44, 0.34, 0.12, 0.64),
                                         (0.46, 0.30, 0.06, 0.60),
                                         (0.02, 0.54, -0.20, 0.56)]):
        blob = Part(pack.color, name="tmp")
        icosphere(blob, subdiv=1, radius=1.0, jitter=0.15, seed=5 + i)
        pack.merge(blob.scale_xyz(pw * r, ph * r, pd * r).transform(
            offset=at(fx, fy, fz)))

    # 肩ストラップ
    for side in (1, -1):
        for k in range(4):
            f = k / 3
            panel(strap, (side * spec["shoulder_half"] * u * 0.66,
                          y["shoulder"] - 0.02 * u - f * 0.62 * u,
                          spec["chest_depth"] * u * (0.94 - f * 0.26)),
                  (1.0, 0.0, 0.0), (0.0, 1.0, -0.22), 0.055 * u, 0.12 * u)

    # 丸めたマット（横向きの円柱）
    prism(roll, 8, 0.22 * u, -0.42 * u, 0.42 * u)
    roll.transform(roll=math.pi / 2, offset=at(-0.46, 0.92, 0.10))

    # 上に突き出た本
    for fx, tilt, hgt in [(0.18, 0.22, 0.44), (0.44, -0.18, 0.34),
                          (-0.06, 0.08, 0.36)]:
        bk = Part(books.color, name="tmp")
        box(bk, -0.16 * u, 0.0, -0.035 * u, 0.16 * u, hgt * u, 0.035 * u)
        books.merge(bk.transform(offset=at(fx, 0.80, -0.10), roll=tilt, tilt=0.14))

    # ソーラーパネル
    box(solar, -0.22 * u, -0.28 * u, -0.02 * u, 0.22 * u, 0.28 * u, 0.02 * u)
    solar.transform(roll=-0.30, tilt=0.22, offset=at(0.86, 0.06, 0.62))

    # スピーカー
    box(speaker, -0.14 * u, -0.22 * u, -0.12 * u, 0.14 * u, 0.22 * u, 0.12 * u)
    speaker.transform(offset=at(-0.90, -0.06, 0.58))

    # 針山（緑の球）と刺さった針
    ball = Part(cushion.color, name="tmp")
    icosphere(ball, subdiv=1, radius=0.19 * u, jitter=0.10, seed=9)
    pin_c = at(-0.02, 1.02, -0.14)
    cushion.merge(ball.transform(offset=pin_c))
    for i in range(5):
        a = i * 1.257
        needle = Part(cushion.color, name="tmp")
        loft(needle, [(0.0, 0.008 * u, 0.008 * u),
                      (0.34 * u, 0.006 * u, 0.006 * u)], sides=4)
        cushion.merge(needle.transform(
            offset=pin_c, roll=math.sin(a) * 0.5, tilt=math.cos(a) * 0.5))

    # ヘッドホン（弓なりのバンド＋イヤーカップ）
    ph_c = at(0.92, 0.58, 0.30)
    for k in range(7):
        a = math.pi * (0.12 + 0.76 * k / 6)
        seg = Part(phones.color, name="tmp")
        box(seg, -0.035 * u, -0.035 * u, -0.05 * u, 0.035 * u, 0.035 * u, 0.05 * u)
        phones.merge(seg.transform(offset=(ph_c[0] + math.cos(a) * 0.28 * u,
                                           ph_c[1] + math.sin(a) * 0.28 * u,
                                           ph_c[2])))
    for sx in (-1, 1):
        cup = Part(phones.color, name="tmp")
        prism(cup, 8, 0.14 * u, -0.05 * u, 0.05 * u)
        phones.merge(cup.transform(
            tilt=math.pi / 2,
            offset=(ph_c[0] + sx * 0.28 * u, ph_c[1] - 0.02 * u, ph_c[2])))

    # 吊るした洗濯物
    for fx, w, hgt in [(-1.02, 0.11, 0.50), (-0.76, 0.10, 0.40),
                       (1.06, 0.11, 0.44), (0.80, 0.09, 0.36)]:
        top = at(fx, -0.24, 0.70)
        panel(cloths, (top[0], top[1] - hgt * u / 2, top[2]),
              (0.0, 1.0, 0.0), (1.0, 0.0, 0.10), hgt * u / 2, w * u)

    # 大きな方位磁針（鎖でぶら下がっている）
    hook = at(0.82, -0.30, 0.80)
    chain = Part(compass.color, name="tmp")
    loft(chain, [(-0.40 * u, 0.010 * u, 0.010 * u), (0.0, 0.010 * u, 0.010 * u)],
         sides=4)
    disc = Part(compass.color, name="tmp")
    prism(disc, 12, 0.22 * u, -0.05 * u, 0.05 * u)
    compass.merge(chain.transform(offset=hook))
    compass.merge(disc.transform(tilt=math.pi / 2,
                                 offset=(hook[0], hook[1] - 0.60 * u, hook[2])))

    # 上に伸びた細い棒（釣り竿のようなもの）
    for fx, fz, lean in [(-0.52, -0.20, -0.34), (0.58, -0.22, 0.30)]:
        rod = Part(rods.color, name="tmp")
        loft(rod, [(0.0, 0.011 * u, 0.011 * u), (1.25 * u, 0.005 * u, 0.005 * u)],
             sides=4)
        rods.merge(rod.transform(offset=at(fx, 0.62, fz), roll=lean, tilt=-0.22))
    return parts


def main() -> int:
    here = os.path.dirname(os.path.abspath(__file__))
    os.makedirs(os.path.join(here, "models"), exist_ok=True)
    parts = build()
    path = os.path.join(here, "models", f"{SPEC['name']}.glb")
    write_glb(path, parts, model_name=SPEC["name"])
    tris = sum(len(p.tris) for p in parts)
    print(f"{path}  ({tris} tris / {len(parts)} materials, "
          f"{os.path.getsize(path)/1024:.1f} KB)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
