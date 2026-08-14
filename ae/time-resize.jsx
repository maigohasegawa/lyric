/*  タイムリサイズ / TIME RESIZE  ------------------------------------------
    After Effects 用スクリプト（ScriptUI パネル）

    タイムラインに並べた動画素材の尺を、直接そのまま変えるためのもの。
    AE 標準の Ctrl/Cmd + レイヤー端ドラッグと違って、

      ・「3秒にする」と尺で指定できる（伸縮率を自分で計算しなくていい）
      ・ワークエリアや他のレイヤーにぴったり合わせられる
      ・複数レイヤーをまとめて処理できる
      ・伸縮しても イン点／現在の時間／アウト点 のどれかが動かない

    という形で指定する。中身でやっているのは AE の時間伸縮（stretch）なので、
    レイヤー上のキーフレームも一緒に伸び縮みする。

    置き場所：
      (AEのインストール先)/Support Files/Scripts/ScriptUI Panels/time-resize.jsx
      → AE を再起動して ウィンドウ > time-resize.jsx

    このファイルは BOM 付き UTF-8。BOM を消すと日本語が化けるので、
    編集するときはそのまま保存すること。
------------------------------------------------------------------------- */

(function (thisObj) {

    var SCRIPT_NAME = "タイムリサイズ";

    // AE の時間伸縮の下限・上限（%）
    var STRETCH_MIN = 1;
    var STRETCH_MAX = 10000;

    // ---------------------------------------------------------------- 下ごしらえ

    function activeComp() {
        if (!app.project) return null;
        var item = app.project.activeItem;
        return (item && item instanceof CompItem) ? item : null;
    }

    // 時間伸縮できるレイヤーか。カメラとライトには stretch が無い
    function canStretch(layer) {
        if (layer instanceof CameraLayer || layer instanceof LightLayer) return false;
        try {
            return typeof layer.stretch === "number";
        } catch (e) {
            return false;
        }
    }

    // 選択中の対象レイヤーを、タイムラインの上から順に返す
    function selectedTargets(comp) {
        var out = [];
        var sel = comp.selectedLayers;
        for (var i = 0; i < sel.length; i++) {
            if (canStretch(sel[i])) out.push(sel[i]);
        }
        out.sort(function (a, b) { return a.index - b.index; });
        return out;
    }

    function snapToFrame(sec, comp) {
        var fd = comp.frameDuration;
        var n = Math.round(sec / fd);
        if (n < 1) n = 1;
        return n * fd;
    }

    function clampStretch(s) {
        if (s < STRETCH_MIN) return STRETCH_MIN;
        if (s > STRETCH_MAX) return STRETCH_MAX;
        return s;
    }

    function round2(n) {
        return Math.round(n * 100) / 100;
    }

    function pct(s) {
        return round2(s) + "%";
    }

    function toFrames(sec, comp) {
        return Math.round(sec / comp.frameDuration);
    }

    function fmtDur(sec, comp) {
        return round2(sec) + "秒 (" + toFrames(sec, comp) + "f)";
    }

    // ---------------------------------------------------------------- 本体

    /*  1レイヤーの尺を want 秒にする。

        伸縮率は「今の伸縮率 × (目標の尺 ÷ 今の尺)」で出す。
        今の尺はトリム後の長さ（outPoint - inPoint）なので、
        すでに切り詰めてあるレイヤーでもそのまま通る。

        hold は伸縮しても動かさない場所：
          "in"      … イン点
          "current" … 現在の時間（その位置に出ている絵が動かない）
          "out"     … アウト点
    */
    function resizeLayer(layer, want, hold, snap, comp) {
        var r = { name: layer.name, ok: false, msg: "", note: "", from: 0, to: 0, dur: 0 };

        if (!canStretch(layer)) { r.msg = "カメラ／ライトは対象外"; return r; }
        if (layer.timeRemapEnabled) {
            r.msg = "タイムリマップが有効なので時間伸縮できない";
            return r;
        }

        var relock = false;
        try {
            if (layer.locked) { layer.locked = false; relock = true; }

            var oldIn    = layer.inPoint;
            var oldOut   = layer.outPoint;
            var oldStart = layer.startTime;
            var oldDur   = oldOut - oldIn;
            var oldS     = layer.stretch;

            if (oldDur <= 0)  { r.msg = "今の尺が0";       return r; }
            if (oldS === 0)   { r.msg = "伸縮率が0";       return r; }

            var target = snap ? snapToFrame(want, comp) : want;
            if (target <= 0) { r.msg = "目標の尺が0以下"; return r; }

            layer.stretch = clampStretch(oldS * (target / oldDur));
            var newS = layer.stretch;   // AE 側で丸められることがあるので読み直す

            // 動かしたくない場所に合わせて、レイヤー全体をずらし戻す
            if (hold === "out") {
                layer.startTime += (oldOut - layer.outPoint);
            } else if (hold === "current") {
                // 現在の時間 t に出ている絵が変わらない開始位置
                var t = comp.time;
                layer.startTime = t - (t - oldStart) * (newS / oldS);
            } else {
                layer.startTime += (oldIn - layer.inPoint);
            }

            // 1フレーム未満の端数が残ったら、トリムで詰めてぴったりにする
            if (snap) {
                var err = target - (layer.outPoint - layer.inPoint);
                if (Math.abs(err) > 1e-7 && Math.abs(err) < comp.frameDuration) {
                    try {
                        if (hold === "out") layer.inPoint  = layer.outPoint - target;
                        else                layer.outPoint = layer.inPoint  + target;
                    } catch (eTrim) { /* 素材の端で詰められないだけなので無視 */ }
                }
            }

            r.ok   = true;
            r.from = oldS;
            r.to   = newS;
            r.dur  = layer.outPoint - layer.inPoint;

            // 目標に届かないことがある（AEの伸縮率が1%〜10000%で頭打ち、
            // または素材の長さが足りずトリムを詰めきれない）ので、そのときは伝える
            if (Math.abs(r.dur - target) > comp.frameDuration / 2) {
                r.note = "目標の尺に届かず（伸縮率の上限／下限か、素材の長さ不足）";
            }
        } catch (e) {
            r.ok  = false;
            r.msg = e.toString();
        } finally {
            if (relock) {
                try { layer.locked = true; } catch (eLock) {}
            }
        }
        return r;
    }

    // ---------------------------------------------------------------- UI

    function build(thisObj) {

        var pal = (thisObj instanceof Panel)
            ? thisObj
            : new Window("palette", SCRIPT_NAME, undefined, { resizeable: true });

        pal.orientation = "column";
        pal.alignChildren = ["fill", "top"];
        pal.spacing = 8;
        pal.margins = 12;
        pal.preferredSize = [320, -1];

        // --- 状態表示 -------------------------------------------------
        var head = pal.add("group");
        head.orientation = "column";
        head.alignChildren = ["fill", "top"];
        head.spacing = 2;

        // statictext は作ったときの文字数で幅が決まってしまうので、
        // あとから長い名前が入っても崩れないよう幅を先に決めておく
        var txtComp = head.add("statictext", undefined, "—", { truncate: "middle" });
        var txtSel  = head.add("statictext", undefined, "—", { truncate: "middle" });
        txtComp.preferredSize.width = 296;
        txtSel.preferredSize.width  = 296;

        // --- 目標の尺 -------------------------------------------------
        var pnlDur = pal.add("panel", undefined, "目標の尺にする");
        pnlDur.orientation = "column";
        pnlDur.alignChildren = ["fill", "top"];
        pnlDur.spacing = 6;
        pnlDur.margins = [10, 14, 10, 10];

        var rowDur = pnlDur.add("group");
        rowDur.alignChildren = ["left", "center"];
        var edDur   = rowDur.add("edittext", undefined, "3");
        edDur.characters = 9;
        var ddUnit  = rowDur.add("dropdownlist", undefined, ["秒", "フレーム"]);
        ddUnit.selection = 0;
        ddUnit.preferredSize.width = 90;

        var rowDurBtn = pnlDur.add("group");
        rowDurBtn.alignChildren = ["fill", "center"];
        var btnLoad  = rowDurBtn.add("button", undefined, "今の尺を読む");
        var btnApply = rowDurBtn.add("button", undefined, "適用");

        // --- 尺を合わせる ---------------------------------------------
        var pnlFit = pal.add("panel", undefined, "尺を合わせる");
        pnlFit.orientation = "column";
        pnlFit.alignChildren = ["fill", "top"];
        pnlFit.spacing = 6;
        pnlFit.margins = [10, 14, 10, 10];

        var rowFit1 = pnlFit.add("group");
        rowFit1.alignChildren = ["fill", "center"];
        var btnWork = rowFit1.add("button", undefined, "ワークエリア");
        var btnComp = rowFit1.add("button", undefined, "コンポ全長");

        var btnRef = pnlFit.add("button", undefined, "一番上の選択レイヤーに合わせる");

        var cbAlignStart = pnlFit.add("checkbox", undefined, "開始位置も合わせる");
        cbAlignStart.value = true;

        // --- 伸縮の基準 -----------------------------------------------
        var pnlHold = pal.add("panel", undefined, "伸縮の基準");
        pnlHold.orientation = "column";
        pnlHold.alignChildren = ["left", "top"];
        pnlHold.spacing = 4;
        pnlHold.margins = [10, 14, 10, 10];

        var rbIn   = pnlHold.add("radiobutton", undefined, "イン点を固定");
        var rbCur  = pnlHold.add("radiobutton", undefined, "現在の時間を固定");
        var rbOut  = pnlHold.add("radiobutton", undefined, "アウト点を固定");
        rbIn.value = true;

        var cbSnap = pnlHold.add("checkbox", undefined, "フレーム単位にそろえる");
        cbSnap.value = true;

        // --- ログ -----------------------------------------------------
        var log = pal.add("edittext", undefined, "", { multiline: true, readonly: true, scrollable: true });
        log.preferredSize = [-1, 96];

        var btnRefresh = pal.add("button", undefined, "選択を読み直す");

        // ------------------------------------------------------------- 表示まわり

        function say(text) {
            log.text = text;
        }

        function holdMode() {
            if (rbOut.value) return "out";
            if (rbCur.value) return "current";
            return "in";
        }

        function currentFps() {
            var comp = activeComp();
            return comp ? comp.frameRate : 30;
        }

        function refresh() {
            var comp = activeComp();
            if (!comp) {
                txtComp.text = "コンポジションが開かれていません";
                txtSel.text  = "—";
                return;
            }
            txtComp.text = comp.name + "　" + round2(comp.frameRate) + "fps　"
                         + fmtDur(comp.duration, comp);

            var layers = selectedTargets(comp);
            if (layers.length === 0) {
                txtSel.text = "選択なし";
            } else if (layers.length === 1) {
                var l = layers[0];
                txtSel.text = "選択：" + l.name + "　"
                            + fmtDur(l.outPoint - l.inPoint, comp) + "　伸縮 " + pct(l.stretch);
            } else {
                txtSel.text = "選択：" + layers.length + "レイヤー（基準＝" + layers[0].name + "）";
            }
        }

        // ------------------------------------------------------------- 実行

        function applyAll(comp, layers, dur, alignStart, snap, label) {
            var hold = holdMode();
            // 開始位置をそろえるときは、いったんイン点基準で伸ばしてから動かす
            if (alignStart !== null) hold = "in";

            var lines = [];
            var okCount = 0;

            app.beginUndoGroup(SCRIPT_NAME + "：" + label);
            try {
                for (var i = 0; i < layers.length; i++) {
                    var layer = layers[i];
                    var r = resizeLayer(layer, dur, hold, snap, comp);

                    if (r.ok && alignStart !== null) {
                        var relock = false;
                        try {
                            if (layer.locked) { layer.locked = false; relock = true; }
                            layer.startTime += (alignStart - layer.inPoint);
                        } catch (eMove) {
                            r.ok = false;
                            r.msg = eMove.toString();
                        } finally {
                            if (relock) {
                                try { layer.locked = true; } catch (eLock) {}
                            }
                        }
                    }

                    if (r.ok) {
                        okCount++;
                        lines.push("・" + r.name + "　" + pct(r.from) + " → " + pct(r.to)
                                 + "　" + fmtDur(r.dur, comp)
                                 + (r.note ? "　※" + r.note : ""));
                    } else {
                        lines.push("× " + r.name + "　" + r.msg);
                    }
                }
            } finally {
                app.endUndoGroup();
            }

            say(label + "　" + okCount + "/" + layers.length + "件　目標 "
                + fmtDur(snap ? snapToFrame(dur, comp) : dur, comp)
                + "\n" + lines.join("\n"));
            refresh();
        }

        // 共通の入口。getPlan は {dur, start, layers, snap, err} を返す
        function run(label, getPlan) {
            var comp = activeComp();
            if (!comp) {
                say("コンポジションを開いてから実行してください。");
                return;
            }
            var layers = selectedTargets(comp);
            if (layers.length === 0) {
                say("タイムラインで、尺を変えたいレイヤーを選んでください。\n"
                    + "（カメラとライトは時間伸縮できないので対象外です）");
                return;
            }

            var plan = getPlan(comp, layers);
            if (plan.err) { say(plan.err); return; }

            applyAll(comp, plan.layers, plan.dur, plan.start, plan.snap, label);
        }

        // ------------------------------------------------------------- 操作

        btnLoad.onClick = function () {
            var comp = activeComp();
            if (!comp) { say("コンポジションを開いてから実行してください。"); return; }
            var layers = selectedTargets(comp);
            if (layers.length === 0) { say("レイヤーを選んでください。"); return; }

            var d = layers[0].outPoint - layers[0].inPoint;
            edDur.text = (ddUnit.selection.index === 1)
                ? String(toFrames(d, comp))
                : String(round2(d));
            say("「" + layers[0].name + "」の尺を読み込みました。");
        };

        ddUnit.onChange = function () {
            var fps = currentFps();
            var v = parseFloat(edDur.text);
            if (isNaN(v)) return;
            // 秒 ↔ フレーム を取り違えないように値も換算する
            edDur.text = (ddUnit.selection.index === 1)
                ? String(Math.round(v * fps))
                : String(round2(v / fps));
        };

        btnApply.onClick = function () {
            run("目標の尺", function (comp, layers) {
                var v = parseFloat(edDur.text);
                if (isNaN(v) || v <= 0) {
                    return { err: "目標の尺には0より大きい数を入れてください。" };
                }
                var dur = (ddUnit.selection.index === 1) ? v * comp.frameDuration : v;
                return { dur: dur, start: null, layers: layers, snap: cbSnap.value };
            });
        };

        btnWork.onClick = function () {
            run("ワークエリアに合わせる", function (comp, layers) {
                return {
                    dur: comp.workAreaDuration,
                    start: cbAlignStart.value ? comp.workAreaStart : null,
                    layers: layers,
                    snap: cbSnap.value
                };
            });
        };

        btnComp.onClick = function () {
            run("コンポ全長に合わせる", function (comp, layers) {
                return {
                    dur: comp.duration,
                    start: cbAlignStart.value ? 0 : null,
                    layers: layers,
                    snap: cbSnap.value
                };
            });
        };

        btnRef.onClick = function () {
            run("基準レイヤーに合わせる", function (comp, layers) {
                if (layers.length < 2) {
                    return { err: "基準にするレイヤーと、合わせたいレイヤーを2つ以上選んでください。\n"
                                + "一番上のレイヤーが基準になります。" };
                }
                var ref = layers[0];
                return {
                    dur: ref.outPoint - ref.inPoint,
                    start: cbAlignStart.value ? ref.inPoint : null,
                    layers: layers.slice(1),
                    // 基準にぴったり合わせたいので、ここではフレームに丸めない
                    snap: false
                };
            });
        };

        btnRefresh.onClick = refresh;

        // ------------------------------------------------------------- 起動

        pal.onResizing = pal.onResize = function () {
            this.layout.resize();
        };
        pal.onActivate = refresh;

        refresh();
        say("タイムラインでレイヤーを選んでから使います。\n"
            + "キーフレームはレイヤーと一緒に伸び縮みします。");

        return pal;
    }

    var ui = build(thisObj);
    if (ui instanceof Window) {
        ui.center();
        ui.show();
    } else {
        ui.layout.layout(true);
        ui.layout.resize();
    }

})(this);
