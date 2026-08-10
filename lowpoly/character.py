#!/usr/bin/env python3
"""パラメータ駆動のローポリ人型キャラクター（5頭身 / Aポーズ / 顔はテクスチャ）。

体型・配色・髪型はすべて SPEC の数値で決まる。参考画像が来たら SPEC を
書き換えるだけで寄せられる設計にしてある。

  python3 lowpoly/character.py           # models/ と preview/ に書き出し
"""

from __future__ import annotations

import math
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from lowpoly import Part, box, face_plate, filter_tris, icosphere, loft, write_glb
from png import Canvas

# --------------------------------------------------------------------------
# キャラクター定義
#
# ここの数値だけでシルエットと配色が決まる。現状は「真宵ヘキ」の資料待ちの
# ためのベース設定で、色は LAYER SONG ツールのパレットを流用している。
# --------------------------------------------------------------------------

SPEC = {
    "name": "heki",
    "height": 1.0,
    "heads": 5.0,

    # 配色（sRGB 表記。マテリアル用にリニアへ変換される）
    "skin":      "#f6d9c6",
    "skin_dark": "#e5b7a1",
    "blush":     "#ee9a8d",
    "hair":      "#2f2a43",
    "hair_lit":  "#4a4168",
    "eye":       "#12c2d6",
    "eye_deep":  "#0b6f80",
    "lash":      "#1d1a2b",
    "brow":      "#3d3557",
    "mouth":     "#c05a70",
    "top":       "#20212b",
    "trim":      "#12c2d6",
    "skirt":     "#2a2b38",
    "socks":     "#f0eef7",
    "shoes":     "#ef3f96",

    # 体型（head_h = 身長 / 頭身 を 1 とした比率）
    "head_rx": 0.44, "head_ry": 0.50, "head_rz": 0.46,
    "neck_r": 0.15,
    "shoulder_half": 0.52,
    "chest_half": 0.42,  "chest_depth": 0.34,
    "waist_half": 0.35,  "waist_depth": 0.29,
    "hip_half": 0.45,    "hip_depth": 0.35,
    "arm_r": 0.145, "wrist_r": 0.10,
    "thigh_r": 0.245, "calf_r": 0.175, "ankle_r": 0.125,

    # ポーズ
    "arm_splay": 0.30,      # A ポーズの開き（ラジアン）
    "arm_forward": 0.10,

    # 髪
    "bangs": 5,
    "side_tail": True,
    "back_len": 0.62,       # 後ろ髪の長さ（head_h 比）

    # 服
    "skirt_len": 0.62,
    "sock_top": 0.30,       # 膝上の位置（脚全長比）
}

# 体のランドマーク（地面〜あごまでを 1 とした比率）
LANDMARKS = {
    "ankle": 0.055, "knee": 0.290, "crotch": 0.530, "hip": 0.570,
    "waist": 0.680, "chest": 0.820, "shoulder": 0.920, "neck": 0.945,
}


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
    """正面の顔だけを描いたテクスチャ。周囲は肌色なので継ぎ目が出ない。

    サイズは 2 のべき乗にしておく（ミップマップと REPEAT ラップの前提）。
    """
    c = Canvas(size, size, ss=3, bg=rgb(spec["skin"]))
    s = size

    eye_y = 0.46 * s
    eye_dx = 0.215 * s
    eye_rx, eye_ry = 0.140 * s, 0.170 * s

    for side in (-1, 1):
        cx = s / 2 + side * eye_dx

        # 白目 → 虹彩 → 瞳孔 → ハイライトの順に重ねる
        c.ellipse(cx, eye_y, eye_rx, eye_ry, (255, 255, 255))
        c.ellipse(cx, eye_y + 0.012 * s, eye_rx * 0.86, eye_ry * 0.88,
                  rgb(spec["eye_deep"]))
        c.ellipse(cx, eye_y + 0.028 * s, eye_rx * 0.80, eye_ry * 0.72,
                  rgb(spec["eye"]))
        c.ellipse(cx, eye_y + 0.040 * s, eye_rx * 0.42, eye_ry * 0.46,
                  rgb(spec["lash"]))
        c.ellipse(cx - side * 0.030 * s, eye_y - 0.042 * s,
                  0.034 * s, 0.030 * s, (255, 255, 255))
        c.ellipse(cx + side * 0.038 * s, eye_y + 0.058 * s,
                  0.018 * s, 0.016 * s, (255, 255, 255), alpha=0.75)

        # 上まつ毛は目の輪郭より少し外へ張り出させる
        c.arc(cx, eye_y, eye_rx * 1.04, eye_ry * 1.04,
              math.pi * 1.06, math.pi * 1.94, 0.030 * s, rgb(spec["lash"]))
        c.capsule(cx + side * eye_rx * 1.02, eye_y - eye_ry * 0.50,
                  cx + side * eye_rx * 1.30, eye_y - eye_ry * 0.90,
                  0.014 * s, rgb(spec["lash"]))
        # 下まつ毛は細く
        c.arc(cx, eye_y, eye_rx * 0.98, eye_ry * 1.0,
              math.pi * 0.18, math.pi * 0.82, 0.011 * s, rgb(spec["lash"]))

        # 眉
        c.capsule(cx - side * 0.075 * s, eye_y - 0.250 * s,
                  cx + side * 0.080 * s, eye_y - 0.225 * s,
                  0.017 * s, rgb(spec["brow"]))

        # 頬の赤み
        c.soft_ellipse(cx + side * 0.030 * s, eye_y + 0.185 * s,
                       0.085 * s, 0.048 * s, rgb(spec["blush"]), alpha=0.55)

    # 鼻（影を一点だけ）と口
    c.soft_ellipse(s / 2, eye_y + 0.150 * s, 0.016 * s, 0.020 * s,
                   rgb(spec["skin_dark"]), alpha=0.7)
    c.arc(s / 2, eye_y + 0.215 * s, 0.038 * s, 0.030 * s,
          math.pi * 0.15, math.pi * 0.85, 0.014 * s, rgb(spec["mouth"]))

    return c.to_png()


# --------------------------------------------------------------------------
# 体
# --------------------------------------------------------------------------

def build(spec: dict = SPEC) -> list[Part]:
    h = spec["height"]
    head_h = h / spec["heads"]
    u = head_h                      # 体格の基準単位
    chin = h - head_h
    y = {k: v * chin for k, v in LANDMARKS.items()}

    skin = Part(srgb(spec["skin"]), roughness=0.85, name="skin")
    hair = Part(srgb(spec["hair"]), roughness=0.7, name="hair")
    top = Part(srgb(spec["top"]), roughness=0.85, name="top")
    trim = Part(srgb(spec["trim"]), roughness=0.6, name="trim")
    skirt = Part(srgb(spec["skirt"]), roughness=0.9, name="skirt")
    socks = Part(srgb(spec["socks"]), roughness=0.9, name="socks")
    shoes = Part(srgb(spec["shoes"]), roughness=0.6, name="shoes")

    head_c = (0.0, chin + head_h * 0.5, 0.0)
    radii = (spec["head_rx"] * u, spec["head_ry"] * u, spec["head_rz"] * u)

    # -- 頭と首 ---------------------------------------------------------
    dome = Part(skin.color, name="tmp")
    icosphere(dome, subdiv=1, radius=1.0)
    dome.scale_xyz(*radii).transform(offset=head_c)
    skin.merge(dome)
    loft(skin, [(y["shoulder"] - 0.01 * u, spec["neck_r"] * u * 1.5,
                 spec["neck_r"] * u * 1.4),
                (y["neck"], spec["neck_r"] * u, spec["neck_r"] * u),
                (chin + 0.02 * u, spec["neck_r"] * u * 0.95,
                 spec["neck_r"] * u * 0.95)], sides=8)

    # -- 顔（テクスチャを貼る板を頭の前面に沿わせる） ---------------------
    face = Part((1.0, 1.0, 1.0), roughness=0.85, name="face",
                texture=face_texture(spec))
    face_plate(face, head_c, radii, yaw_span=math.radians(40),
               pitch_hi=math.radians(30), pitch_lo=math.radians(-40),
               cols=5, rows=5, bulge=1.015)

    # -- 胴（服）--------------------------------------------------------
    loft(top, [(y["hip"] - 0.02 * u, spec["hip_half"] * u, spec["hip_depth"] * u),
               (y["waist"], spec["waist_half"] * u, spec["waist_depth"] * u),
               (y["chest"], spec["chest_half"] * u, spec["chest_depth"] * u),
               (y["shoulder"], spec["shoulder_half"] * u * 0.94,
                spec["chest_depth"] * u * 0.92),
               (y["shoulder"] + 0.03 * u, spec["shoulder_half"] * u * 0.72,
                spec["chest_depth"] * u * 0.72)], sides=10)
    # 襟もと
    loft(trim, [(y["shoulder"] + 0.015 * u, spec["shoulder_half"] * u * 0.80,
                 spec["chest_depth"] * u * 0.80),
                (y["shoulder"] + 0.05 * u, spec["shoulder_half"] * u * 0.62,
                 spec["chest_depth"] * u * 0.64)], sides=10, cap_top=False)

    # -- 腕（Aポーズ）---------------------------------------------------
    up_len, lo_len = 0.74 * u, 0.70 * u
    arm = Part(skin.color, name="tmp")
    loft(arm, [(-(up_len + lo_len) - 0.22 * u, spec["wrist_r"] * u * 0.80,
                spec["wrist_r"] * u * 1.05),
               (-(up_len + lo_len), spec["wrist_r"] * u, spec["wrist_r"] * u),
               (-up_len, spec["arm_r"] * u * 0.82, spec["arm_r"] * u * 0.82),
               (0.0, spec["arm_r"] * u, spec["arm_r"] * u),
               (0.10 * u, spec["arm_r"] * u * 0.86, spec["arm_r"] * u * 0.86)],
         sides=7)
    sleeve = Part(top.color, name="tmp")
    loft(sleeve, [(-0.42 * u, spec["arm_r"] * u * 1.12, spec["arm_r"] * u * 1.12),
                  (0.02 * u, spec["arm_r"] * u * 1.22, spec["arm_r"] * u * 1.22),
                  (0.12 * u, spec["arm_r"] * u * 1.0, spec["arm_r"] * u * 1.0)],
         sides=7)

    shoulder_pt = (spec["shoulder_half"] * u * 0.88, y["shoulder"], 0.0)
    for side in (1, -1):
        a, s_ = arm.copy(), sleeve.copy()
        if side < 0:
            a.mirror_x()
            s_.mirror_x()
        off = (side * shoulder_pt[0], shoulder_pt[1], shoulder_pt[2])
        skin.merge(a.transform(offset=off, roll=side * spec["arm_splay"],
                               tilt=spec["arm_forward"]))
        top.merge(s_.transform(offset=off, roll=side * spec["arm_splay"],
                               tilt=spec["arm_forward"]))

    # -- 脚 -------------------------------------------------------------
    leg_x = spec["hip_half"] * u * 0.52
    sock_y = y["ankle"] + (y["crotch"] - y["ankle"]) * spec["sock_top"]
    for side in (1, -1):
        x = side * leg_x
        leg = Part(skin.color, name="tmp")
        loft(leg, [(y["ankle"], spec["ankle_r"] * u, spec["ankle_r"] * u),
                   (y["knee"], spec["calf_r"] * u, spec["calf_r"] * u),
                   (y["crotch"] + 0.10 * u, spec["thigh_r"] * u,
                    spec["thigh_r"] * u)], sides=7)
        skin.merge(leg.transform(offset=(x, 0.0, 0.0)))

        sock = Part(socks.color, name="tmp")
        loft(sock, [(y["ankle"] - 0.01 * u, spec["ankle_r"] * u * 1.10,
                     spec["ankle_r"] * u * 1.10),
                    (y["knee"], spec["calf_r"] * u * 1.08,
                     spec["calf_r"] * u * 1.08),
                    (sock_y, spec["calf_r"] * u * 1.14,
                     spec["calf_r"] * u * 1.14)], sides=7)
        socks.merge(sock.transform(offset=(x, 0.0, 0.0)))

        shoe = Part(shoes.color, name="tmp")
        box(shoe, -spec["ankle_r"] * u * 1.25, 0.0, -spec["ankle_r"] * u * 1.5,
            spec["ankle_r"] * u * 1.25, spec["ankle_r"] * u * 1.7,
            spec["ankle_r"] * u * 2.4)
        shoes.merge(shoe.transform(offset=(x, 0.0, 0.0)))

    # -- スカート -------------------------------------------------------
    skirt_bottom = y["hip"] - spec["skirt_len"] * u
    loft(skirt, [(skirt_bottom, spec["hip_half"] * u * 1.55,
                  spec["hip_depth"] * u * 1.55),
                 (y["hip"] - 0.10 * u, spec["hip_half"] * u * 1.12,
                  spec["hip_depth"] * u * 1.12),
                 (y["waist"], spec["waist_half"] * u * 1.05,
                  spec["waist_depth"] * u * 1.05)], sides=12, cap_top=False)

    # -- 髪 -------------------------------------------------------------
    _build_hair(hair, spec, head_c, radii, u, chin)

    return [skin, face, hair, top, trim, skirt, socks, shoes]


def _build_hair(hair: Part, spec: dict, head_c, radii, u: float, chin: float) -> None:
    """頭を覆うキャップ＋前髪＋後ろ髪。顔の窓の部分だけ面を抜く。"""
    cap = Part(hair.color, name="tmp")
    icosphere(cap, subdiv=2, radius=1.0)

    def keeps(centroid) -> bool:
        """顔にあたる面を抜いて窓を開ける。前髪はこの窓の上辺に載る。"""
        x, y_, z = centroid
        ln = math.sqrt(x * x + y_ * y_ + z * z) or 1.0
        x, y_, z = x / ln, y_ / ln, z / ln
        front = z > math.cos(math.radians(58))
        return not (front and y_ < 0.34)

    filter_tris(cap, keeps)
    cap.scale_xyz(radii[0] * 1.09, radii[1] * 1.07, radii[2] * 1.11)
    hair.merge(cap.transform(offset=(0.0, head_c[1], head_c[2] - radii[2] * 0.05)))

    # 前髪：眉のすぐ上で切りそろえる。長すぎると目が隠れる
    n = spec["bangs"]
    brow_y = head_c[1] + radii[1] * 0.30
    for i in range(n):
        t = (i / (n - 1)) * 2 - 1                      # -1..1
        bang = Part(hair.color, name="tmp")
        yaw = t * math.radians(50)
        top_y = head_c[1] + radii[1] * 0.86
        length = (top_y - brow_y) + 0.05 * u * (1 - abs(t))
        loft(bang, [(-length, 0.034 * u, 0.022 * u),
                    (-length * 0.45, 0.055 * u, 0.032 * u),
                    (0.0, 0.066 * u, 0.036 * u)], sides=5)
        hair.merge(bang.transform(
            offset=(math.sin(yaw) * radii[0] * 0.96, top_y,
                    math.cos(yaw) * radii[2] * 0.99),
            rot_y=yaw, tilt=-0.14 + 0.06 * abs(t)))

    # 後ろ髪
    back = Part(hair.color, name="tmp")
    back_len = spec["back_len"] * u
    base_y = head_c[1] - radii[1] * 0.35
    loft(back, [(base_y - back_len, radii[0] * 0.72, radii[2] * 0.46),
                (base_y - back_len * 0.45, radii[0] * 1.00, radii[2] * 0.60),
                (head_c[1] + radii[1] * 0.30, radii[0] * 1.06, radii[2] * 0.82),
                (head_c[1] + radii[1] * 0.72, radii[0] * 0.78, radii[2] * 0.60)],
         sides=9, cap_top=False)
    hair.merge(back.transform(offset=(0.0, 0.0, -radii[2] * 0.30)))

    # サイドの束
    if spec["side_tail"]:
        for side in (1, -1):
            tail = Part(hair.color, name="tmp")
            loft(tail, [(-0.95 * u, 0.028 * u, 0.028 * u),
                        (-0.50 * u, 0.062 * u, 0.055 * u),
                        (0.0, 0.078 * u, 0.070 * u)], sides=6)
            hair.merge(tail.transform(
                offset=(side * radii[0] * 0.92, head_c[1] + radii[1] * 0.34,
                        -radii[2] * 0.10),
                roll=side * 0.13))


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
