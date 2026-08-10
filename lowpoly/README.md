# ローポリ 3D モデル生成（After Effects 用）

Blender も外部ライブラリも使わず、Python 標準ライブラリだけで
glTF 2.0 バイナリ（`.glb`）を書き出します。AE にそのまま読み込めます。

```bash
python3 lowpoly/lowpoly.py            # models/ に全モデルを書き出し
python3 lowpoly/lowpoly.py crystal    # 個別に書き出し
python3 lowpoly/check.py              # 面の向き・退化三角形の自己診断
python3 lowpoly/preview.py            # preview/ に PNG プレビューを描画
```

## 収録モデル

| モデル | ファイル | ポリゴン | マテリアル |
|---|---|---|---|
| クリスタル群 | `models/crystal.glb` | 112 | 半透明シアン / マゼンタの発光体 |
| 山（地形） | `models/terrain.glb` | 648 | 岩 / 草 / 雪（標高で自動振り分け） |
| 針葉樹 | `models/tree.glb` | 52 | 幹 / 葉 |
| 環のある惑星 | `models/planet.glb` | 192 | 本体 / 環 |

いずれも 1 ユニット前後のサイズ、Y 軸が上、原点が接地面（惑星のみ中心）です。

## AE での使い方

1. **ファイル > 読み込み > ファイル** で `.glb` を選択
2. プロジェクトパネルからコンポジションにドラッグ
3. レンダラーが自動で **Advanced 3D** に切り替わる（`.glb` は必須条件）
4. ライトを追加する。PBR マテリアルなので **環境ライト**を入れると金属・粗さが効く

AE が読めるのは GLB / glTF / OBJ / FBX（FBX はベータ）で、
GLB はテクスチャなどを 1 ファイルに同梱できるため取り回しが一番楽です。

### 注意点

- **Advanced 3D は裏面を描画しない。** 面の向き（巻き方向）が揃っていないと
  モデルの中が透けて見えます。`check.py` が符号付き体積で全パーツを検算します。
- **ローポリの見た目はフラットシェーディングで作っている。** 面ごとに頂点を
  複製して面法線を持たせているため、頂点数は共有した場合より多くなります。
- モデルは実寸で 1 ユニット程度です。コンポ内では **レイヤーのスケール**で
  好みの大きさに合わせてください。

## 新しいモデルを足す

`Part`（1 マテリアル分のメッシュ）にプリミティブを積んでいくだけです。

```python
def make_pillar():
    stone = Part((0.6, 0.6, 0.65), roughness=0.9, name="stone")
    prism(stone, 6, 0.2, 0.0, 1.2, taper=0.85, twist=0.2)
    cone(stone, 6, 0.28, 1.2, 1.5)
    return [stone]

MODELS["pillar"] = (make_pillar, "低ポリ 石柱")
```

使えるプリミティブは `prism`（角柱・円錐台・尖端）、`cone`、`ring`（穴あきの環）、
`icosphere`（`jitter` を上げると岩になる）、`_value_noise`（地形の高さ）です。
`Part.transform()` は拡大・傾き・Y 回転・平行移動、`Part.merge()` は
別パーツの取り込みに使います。

追加したら必ず `check.py` を通してください。glTF バリデータは
巻き方向を検証しないので、裏返りはここでしか捕まりません。
