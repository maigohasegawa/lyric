#!/usr/bin/env python3
"""Generate GrainImage.amxd — a Max for Live instrument that plays an image
or a video frame as granular sound.

    python3 m4l/build_device.py

Signal path
-----------
The picture is resampled to a 256x256 matrix. Its red and blue planes are
mapped to -1..1 and stored in a 2-plane float32 matrix (`---wav`). Each of the
256 rows is therefore a 256-sample wavetable, and the picture as a whole is a
stack of 256 wavetables that morph from top to bottom.

Eight grain streams run in parallel, evenly staggered in phase. Every stream
is one `p ig.grain` subpatcher containing an oscillator (`phasor~` ->
`jit.peek~`) that reads a row of the picture at audio rate, a Hann window,
and a set of per-grain random values sampled at the grain boundary
(`noise~` -> `sah~`) for position spray, detune and panning. Red drives the
left channel and blue the right, so the colour of the picture becomes stereo
width.

Because the oscillator reads the picture live, loading a video and letting it
play makes the wavetables change every frame.
"""

from __future__ import annotations

import json
from pathlib import Path

from amxd import ensure_amxd_project_block, pack_amxd, unpack_amxd
from maxpat import Patcher, live_param

HERE = Path(__file__).resolve().parent

WIDTH = 256          # wavetable length, in samples
HEIGHT = 256         # number of wavetables stacked vertically
VOICES = 8           # parallel grain streams
# Live replaces `---` with a number that is unique to each device instance but
# shared by every object inside it, so two copies of the device on two tracks
# do not fight over the same matrix.
MATRIX = "---wav"

DEVICE_W = 588.0
DEVICE_H = 168.0


# ---------------------------------------------------------------------------
# grain voice
# ---------------------------------------------------------------------------

# inlet order (all signals)
IN_PH, IN_FREQ, IN_DUTY, IN_YPOS, IN_SPRAY, IN_SWEEP, IN_DETUNE, IN_STEREO, IN_COLOR = range(9)

INLET_NAMES = [
    "grain phase 0-1",
    "oscillator frequency (Hz)",
    "duty / grain length 0-1",
    "row position 0-1",
    "position spray 0-1",
    "row sweep per grain 0-1",
    "detune 0-1",
    "stereo spread 0-1",
    "colour separation 0-1",
]


def build_grain_voice() -> Patcher:
    p = Patcher(rect=(40.0, 80.0, 1120.0, 760.0))

    ins = [
        p.obj("inlet", 20 + i * 90, 20, w=34, comment=INLET_NAMES[i])
        for i in range(9)
    ]
    ph, freq, duty, ypos, spray, sweep, detune, stereo, color = ins

    def at(col: int, row: int) -> tuple:
        return (20.0 + col * 165.0, 80.0 + row * 42.0)

    # --- grain boundary trigger: phasor~ wrap -> one-sample 1 ------------
    p.comment("grain start = phasor~ wrap", *at(0, 0), w=160)
    delta = p.obj("delta~", *at(0, 1))
    trig = p.obj("<~ 0.", *at(0, 2))
    p.connect(ph, 0, delta, 0)
    p.connect(delta, 0, trig, 0)

    # --- per-grain random values, held for the length of the grain -------
    p.comment("per-grain randoms", *at(1, 0), w=160)
    rnd = []
    for i in range(4):
        n = p.obj("noise~", 20.0 + (1 + i) * 165.0, 122.0)
        s = p.obj("sah~ 0.5", 20.0 + (1 + i) * 165.0, 164.0)
        p.connect(n, 0, s, 0)
        p.connect(trig, 0, s, 1)
        rnd.append(s)
    rnd_y, rnd_detune, rnd_pan, rnd_sweep = rnd

    # --- oscillator: read one row of the picture at audio rate -----------
    p.comment("oscillator", *at(0, 5), w=160)
    det_amt = p.obj("*~", *at(0, 6))
    ratio = p.obj("+~ 1.", *at(0, 7))
    fk = p.obj("*~", *at(0, 8))
    osc = p.obj("phasor~ 0.", *at(0, 9))
    xcell = p.obj(f"*~ {float(WIDTH)}", *at(0, 10))
    xclip = p.obj(f"minimum~ {float(WIDTH - 1)}", *at(0, 11))
    p.connect(detune, 0, det_amt, 0)
    p.connect(rnd_detune, 0, det_amt, 1)
    p.connect(det_amt, 0, ratio, 0)
    p.connect(freq, 0, fk, 0)
    p.connect(ratio, 0, fk, 1)
    p.connect(fk, 0, osc, 0)
    p.chain(osc, xcell, xclip)

    # --- row position: dial + spray, sweeping across the grain -----------
    p.comment("row position", *at(1, 5), w=160)
    spray_amt = p.obj("*~", *at(1, 6))
    ybase = p.obj("+~", *at(1, 7))
    sweep_amt = p.obj("*~", *at(1, 8))
    ydrift = p.obj("*~", *at(1, 9))
    ysum = p.obj("+~", *at(1, 10))
    ycell = p.obj(f"*~ {float(HEIGHT - 1)}", *at(1, 11))
    yhi = p.obj(f"minimum~ {float(HEIGHT - 1)}", *at(1, 12))
    ylo = p.obj("maximum~ 0.", *at(1, 13))
    p.connect(spray, 0, spray_amt, 0)
    p.connect(rnd_y, 0, spray_amt, 1)
    p.connect(ypos, 0, ybase, 0)
    p.connect(spray_amt, 0, ybase, 1)
    p.connect(sweep, 0, sweep_amt, 0)
    p.connect(rnd_sweep, 0, sweep_amt, 1)
    p.connect(ph, 0, ydrift, 0)
    p.connect(sweep_amt, 0, ydrift, 1)
    p.connect(ybase, 0, ysum, 0)
    p.connect(ydrift, 0, ysum, 1)
    p.chain(ysum, ycell, yhi, ylo)

    # --- read the two planes ---------------------------------------------
    p.comment("read picture: red / blue", *at(2, 5), w=160)
    peek_r = p.obj(f"jit.peek~ {MATRIX} 2 0", *at(2, 6), w=150)
    peek_b = p.obj(f"jit.peek~ {MATRIX} 2 1", *at(2, 7), w=150)
    for pk in (peek_r, peek_b):
        p.connect(xclip, 0, pk, 0)
        p.connect(ylo, 0, pk, 1)

    # --- colour separation: crossfade mono <-> red/blue -------------------
    mono_sum = p.obj("+~", *at(2, 8))
    mono = p.obj("*~ 0.5", *at(2, 9))
    p.connect(peek_r, 0, mono_sum, 0)
    p.connect(peek_b, 0, mono_sum, 1)
    p.connect(mono_sum, 0, mono, 0)

    src = []
    for i, pk in enumerate((peek_r, peek_b)):
        diff = p.obj("-~", 20.0 + (2 + i) * 165.0, 500.0)
        scaled = p.obj("*~", 20.0 + (2 + i) * 165.0, 542.0)
        summed = p.obj("+~", 20.0 + (2 + i) * 165.0, 584.0)
        p.connect(pk, 0, diff, 0)
        p.connect(mono, 0, diff, 1)
        p.connect(diff, 0, scaled, 0)
        p.connect(color, 0, scaled, 1)
        p.connect(scaled, 0, summed, 0)
        p.connect(mono, 0, summed, 1)
        src.append(summed)
    src_l, src_r = src

    # --- Hann window over the first `duty` of the grain -------------------
    p.comment("Hann window", *at(4, 5), w=160)
    phd = p.obj("/~", *at(4, 6))
    phd_lim = p.obj("minimum~ 1.", *at(4, 7))
    wcos = p.obj("cycle~ 0.", *at(4, 8))
    wneg = p.obj("*~ -0.5", *at(4, 9))
    win = p.obj("+~ 0.5", *at(4, 10))
    p.connect(ph, 0, phd, 0)
    p.connect(duty, 0, phd, 1)
    p.connect(phd, 0, phd_lim, 0)
    p.connect(phd_lim, 0, wcos, 1)  # signal phase into cycle~'s right inlet
    p.chain(wcos, wneg, win)

    # --- equal-power pan --------------------------------------------------
    p.comment("equal-power pan", *at(5, 5), w=160)
    pan_amt = p.obj("*~", *at(5, 6))
    pan_half = p.obj("*~ 0.5", *at(5, 7))
    pan = p.obj("+~ 0.5", *at(5, 8))
    pan_q = p.obj("*~ 0.25", *at(5, 9))
    pan_q2 = p.obj("+~ 0.75", *at(5, 10))
    gain_l = p.obj("cycle~ 0.", *at(5, 11))
    gain_r = p.obj("cycle~ 0.", *at(5, 12))
    p.connect(stereo, 0, pan_amt, 0)
    p.connect(rnd_pan, 0, pan_amt, 1)
    p.chain(pan_amt, pan_half, pan, pan_q)
    p.connect(pan_q, 0, pan_q2, 0)
    p.connect(pan_q, 0, gain_l, 1)
    p.connect(pan_q2, 0, gain_r, 1)

    # --- output ------------------------------------------------------------
    outs = []
    for i, (s, g) in enumerate(((src_l, gain_l), (src_r, gain_r))):
        windowed = p.obj("*~", 20.0 + i * 200.0, 660.0)
        panned = p.obj("*~", 20.0 + i * 200.0, 692.0)
        p.connect(s, 0, windowed, 0)
        p.connect(win, 0, windowed, 1)
        p.connect(windowed, 0, panned, 0)
        p.connect(g, 0, panned, 1)
        out = p.obj("outlet", 20.0 + i * 200.0, 726.0, w=34,
                    comment=("left" if i == 0 else "right"))
        p.connect(panned, 0, out, 0)
        outs.append(out)

    return p


# ---------------------------------------------------------------------------
# device
# ---------------------------------------------------------------------------

def build_device() -> dict:
    p = Patcher(rect=(59.0, 104.0, DEVICE_W, DEVICE_H), openinpresentation=1)

    def dial(longname, short, x, y, mmin, mmax, init, unitstyle=1, exponent=None,
             px=None, py=None):
        return p.ui(
            "live.dial", x, y, 48.0, 48.0,
            numinlets=1, numoutlets=2,
            varname=longname,
            parameter_enable=1,
            presentation=1,
            presentation_rect=[float(px), float(py), 48.0, 48.0],
            saved_attribute_attributes=live_param(
                longname, short, 0, mmin, mmax, init, unitstyle, exponent
            ),
        )

    def smooth(source, x, y, ramp=20):
        """live.dial float -> smoothed signal."""
        pk = p.obj(f"pack 0. {ramp}", x, y)
        ln = p.obj("line~", x, y + 26)
        p.connect(source, 0, pk, 0)
        p.connect(pk, 0, ln, 0)
        return ln

    # ================= presentation: title & preview ======================
    p.comment("GRAIN IMAGE", 20, 20, w=140, presentation=1,
              presentation_rect=[6.0, 2.0, 140.0, 18.0],
              fontsize=11.0)

    pwindow = p.ui("jit.pwindow", 20, 50, 116.0, 88.0,
                   numinlets=1, numoutlets=2,
                   presentation=1, presentation_rect=[6.0, 20.0, 116.0, 88.0])

    btn_img = p.ui("textbutton", 20, 150, 56.0, 20.0,
                   numinlets=1, numoutlets=3, mode=0, text="IMAGE",
                   presentation=1, presentation_rect=[6.0, 112.0, 56.0, 20.0])
    btn_vid = p.ui("textbutton", 84, 150, 56.0, 20.0,
                   numinlets=1, numoutlets=3, mode=0, text="VIDEO",
                   presentation=1, presentation_rect=[66.0, 112.0, 56.0, 20.0])
    drop = p.ui("dropfile", 20, 180, 116.0, 26.0,
                numinlets=1, numoutlets=2,
                presentation=1, presentation_rect=[6.0, 136.0, 116.0, 26.0])

    # ================= presentation: parameters ===========================
    row1_y, row2_y = 22.0, 96.0
    col = lambda i: 132.0 + i * 52.0  # noqa: E731

    d_position = dial("Position", "Pos", 200, 20, 0.0, 1.0, 0.5, px=col(0), py=row1_y)
    d_scan     = dial("Scan", "Scan", 260, 20, -2.0, 2.0, 0.0, px=col(1), py=row1_y)
    d_spray    = dial("Spray", "Spray", 320, 20, 0.0, 1.0, 0.15, px=col(2), py=row1_y)
    d_grain    = dial("Grain", "Grain", 380, 20, 5.0, 500.0, 90.0, unitstyle=2,
                      exponent=2.0, px=col(3), py=row1_y)
    d_density  = dial("Density", "Dens", 440, 20, 0.5, 40.0, 12.0, unitstyle=3,
                      exponent=2.0, px=col(4), py=row1_y)
    d_pitch    = dial("Pitch", "Pitch", 500, 20, -24.0, 24.0, 0.0, unitstyle=7,
                      px=col(5), py=row1_y)
    d_detune   = dial("Detune", "Det", 560, 20, 0.0, 1.0, 0.06, px=col(6), py=row1_y)

    d_sweep    = dial("Sweep", "Sweep", 200, 90, 0.0, 1.0, 0.12, px=col(0), py=row2_y)
    d_color    = dial("Color", "Color", 260, 90, 0.0, 1.0, 0.6, px=col(1), py=row2_y)
    d_stereo   = dial("Stereo", "Stereo", 320, 90, 0.0, 1.0, 0.7, px=col(2), py=row2_y)
    d_tone     = dial("Tone", "Tone", 380, 90, 200.0, 18000.0, 9000.0, unitstyle=3,
                      exponent=3.0, px=col(3), py=row2_y)
    d_contrast = dial("Contrast", "Cont", 440, 90, 0.2, 4.0, 1.6, px=col(4), py=row2_y)
    d_volume   = dial("Volume", "Vol", 500, 90, -70.0, 6.0, -12.0, unitstyle=4,
                      px=col(5), py=row2_y)

    n_note = p.ui("live.numbox", 560, 90, 48.0, 18.0,
                  numinlets=1, numoutlets=2, varname="Note",
                  parameter_enable=1, presentation=1,
                  presentation_rect=[col(6), row2_y + 16.0, 48.0, 18.0],
                  saved_attribute_attributes=live_param(
                      "Note", "Note", 1, 24.0, 84.0, 48.0, 0))
    p.comment("NOTE", 560, 70, w=48, presentation=1,
              presentation_rect=[col(6), row2_y, 48.0, 16.0], fontsize=9.0)

    t_drone = p.ui("live.toggle", 630, 20, 20.0, 20.0,
                   numinlets=1, numoutlets=2, varname="Drone",
                   parameter_enable=1, presentation=1,
                   presentation_rect=[504.0, 30.0, 20.0, 20.0],
                   saved_attribute_attributes=live_param(
                       "Drone", "Drone", 2, 0.0, 1.0, 1.0, 0, enum=["off", "on"]))
    p.comment("DRONE", 630, 44, w=60, presentation=1,
              presentation_rect=[500.0, 52.0, 60.0, 16.0], fontsize=9.0)

    t_live = p.ui("live.toggle", 630, 90, 20.0, 20.0,
                  numinlets=1, numoutlets=2, varname="Live",
                  parameter_enable=1, presentation=1,
                  presentation_rect=[504.0, 96.0, 20.0, 20.0],
                  saved_attribute_attributes=live_param(
                      "Live", "Live", 2, 0.0, 1.0, 1.0, 0, enum=["off", "on"]))
    p.comment("LIVE", 630, 114, w=60, presentation=1,
              presentation_rect=[500.0, 118.0, 60.0, 16.0], fontsize=9.0)

    # ================= file loading =======================================
    p.comment("--- file loading: video goes to jit.movie, everything else is "
              "imported as a still ---", 20, 214, w=520)

    # textbutton emits its own value; `t b` normalises that to a bang
    t_img_b = p.trigger("b", 20, 270)
    dlg_img = p.obj("opendialog", 20, 306)
    p.connect(btn_img, 0, t_img_b, 0)
    p.connect(t_img_b, 0, dlg_img, 0)

    t_vid_b = p.trigger("b", 140, 270)
    dlg_vid = p.obj("opendialog", 140, 306)
    p.connect(btn_vid, 0, t_vid_b, 0)
    p.connect(t_vid_b, 0, dlg_vid, 0)

    # Drag & drop picks its branch from the file extension. The gate is armed
    # for "still" first and only upgraded to "video" when the pattern matches,
    # so an unrecognised extension falls back to importmovie rather than
    # silently going nowhere.
    t_drop = p.trigger("s s s", 260, 240)
    msg_img = p.msg("1", 260, 276)
    rex = p.obj(
        "regexp (mp4|mov|m4v|avi|mkv|webm|MP4|MOV|M4V|AVI|MKV|WEBM)$",
        360, 276, w=380)
    msg_vid = p.msg("2", 360, 312)
    gate = p.obj("gate 2", 260, 348)
    p.connect(drop, 0, t_drop, 0)
    p.connect(t_drop, 2, msg_img, 0)
    p.connect(msg_img, 0, gate, 0)
    p.connect(t_drop, 1, rex, 0)
    p.connect(rex, 0, msg_vid, 0)
    p.connect(msg_vid, 0, gate, 0)
    p.connect(t_drop, 0, gate, 1)

    # still image branch: importmovie first (right outlet), then bang the
    # matrix so it pushes the freshly loaded frame downstream
    t_still = p.trigger("b s", 20, 380)
    imp = p.obj("prepend importmovie", 140, 412)
    mx_load = p.obj(f"jit.matrix ---load 4 char {WIDTH} {HEIGHT}", 20, 470, w=250)
    p.connect(dlg_img, 0, t_still, 0)
    p.connect(gate, 0, t_still, 0)
    p.connect(t_still, 1, imp, 0)
    p.connect(imp, 0, mx_load, 0)
    p.connect(t_still, 0, mx_load, 0)

    # video branch
    rd = p.obj("prepend read", 420, 412)
    movie = p.obj("jit.movie @autostart 1 @loop 1", 420, 470, w=220)
    p.connect(dlg_vid, 0, rd, 0)
    p.connect(gate, 1, rd, 0)
    p.connect(rd, 0, movie, 0)

    qm = p.obj("qmetro 25", 660, 412)
    p.connect(t_live, 0, qm, 0)
    p.connect(qm, 0, movie, 0)

    # ================= picture -> wavetable stack =========================
    p.comment("--- picture to wavetables: red -> left plane, blue -> right "
              "plane, 0..1 remapped to -1..1 ---", 20, 510, w=560)

    mx_rgb = p.obj(f"jit.matrix ---rgb 4 char {WIDTH} {HEIGHT} @interp 1",
                   20, 540, w=300)
    p.connect(mx_load, 0, mx_rgb, 0)
    p.connect(movie, 0, mx_rgb, 0)
    p.connect(mx_rgb, 0, pwindow, 0)

    unpack = p.obj("jit.unpack 4", 20, 576)
    pack = p.obj("jit.pack 2", 20, 612)
    mx_f32 = p.obj(f"jit.matrix ---f32 2 float32 {WIDTH} {HEIGHT}", 20, 648, w=280)
    op_bias = p.obj("jit.op @op - @val 0.5", 20, 684, w=180)
    op_gain = p.obj("jit.op @op * @val 1.6", 20, 720, w=180)
    mx_wav = p.obj(f"jit.matrix {MATRIX} 2 float32 {WIDTH} {HEIGHT}", 20, 756, w=280)
    p.connect(mx_rgb, 0, unpack, 0)
    p.connect(unpack, 1, pack, 0)   # red
    p.connect(unpack, 3, pack, 1)   # blue
    p.chain(pack, mx_f32, op_bias, op_gain, mx_wav)

    pre_contrast = p.obj("prepend val", 220, 684)
    p.connect(d_contrast, 0, pre_contrast, 0)
    p.connect(pre_contrast, 0, op_gain, 0)

    # ================= control signals ====================================
    p.comment("--- control signals ---", 780, 240, w=200)

    # Position sets the scan phasor's phase, Scan sets its rate, so the
    # playhead wraps around the picture instead of sticking at the edges.
    scan = p.obj("phasor~ 0.", 780, 270)
    p.connect(d_scan, 0, scan, 0)
    p.connect(d_position, 0, scan, 1)

    sig_spray = smooth(d_spray, 780, 320)
    sig_sweep = smooth(d_sweep, 780, 380)
    sig_detune = smooth(d_detune, 780, 440)
    sig_stereo = smooth(d_stereo, 780, 500)
    sig_color = smooth(d_color, 780, 560)

    # duty = grain length * density, so Grain stays in milliseconds
    # seeded with the dial's own default so the first duty is sane whichever
    # order Live restores the two parameters in
    f_grain = p.obj("f 90", 960, 270)
    t_dens = p.trigger("b f", 1060, 240)
    ex_duty = p.obj("expr $f1 * $f2 * 0.001", 960, 306, w=180)
    cl_duty = p.obj("clip 0.02 1.", 960, 342)
    p.connect(d_grain, 0, f_grain, 0)
    p.connect(d_density, 0, t_dens, 0)
    p.connect(t_dens, 1, ex_duty, 1)
    p.connect(t_dens, 0, f_grain, 0)
    p.connect(f_grain, 0, ex_duty, 0)
    p.connect(ex_duty, 0, cl_duty, 0)
    sig_duty = smooth(cl_duty, 960, 378)

    # pitch = MIDI note (or the Note box) + Pitch in semitones
    midi = p.obj("notein", 1240, 240)
    strip = p.obj("stripnote", 1240, 276)
    f_note = p.obj("f 48", 1240, 312)
    t_pitch = p.trigger("b f", 1340, 276)
    add_pitch = p.obj("+ 0.", 1240, 348)
    tofreq = p.obj("mtof", 1240, 384)
    p.connect(midi, 0, strip, 0)
    p.connect(midi, 1, strip, 1)
    p.connect(strip, 0, f_note, 0)
    p.connect(n_note, 0, f_note, 0)
    p.connect(d_pitch, 0, t_pitch, 0)
    p.connect(t_pitch, 1, add_pitch, 1)
    p.connect(t_pitch, 0, f_note, 0)
    p.connect(f_note, 0, add_pitch, 0)
    p.connect(add_pitch, 0, tofreq, 0)
    sig_freq = smooth(tofreq, 1240, 420)

    # ================= grain streams ======================================
    p.comment(f"--- {VOICES} grain streams, evenly staggered in phase ---",
              20, 790, w=400)

    voice_patch = build_grain_voice()
    thisdevice = p.obj("live.thisdevice", 460, 812, w=120)
    stagger = p.trigger(
        " ".join(f"{i / VOICES}" for i in range(VOICES - 1, -1, -1)), 20, 844)
    p.connect(thisdevice, 0, stagger, 0)

    voices = []
    for k in range(VOICES):
        x = 20.0 + k * 150.0
        ph = p.obj("phasor~ 0.", x, 880)
        p.connect(d_density, 0, ph, 0)
        p.connect(stagger, VOICES - 1 - k, ph, 1)

        v = p.subpatcher("ig.grain", voice_patch, x, 920,
                         numinlets=9, numoutlets=2, w=110)
        p.connect(ph, 0, v, IN_PH)
        p.connect(sig_freq, 0, v, IN_FREQ)
        p.connect(sig_duty, 0, v, IN_DUTY)
        p.connect(scan, 0, v, IN_YPOS)
        p.connect(sig_spray, 0, v, IN_SPRAY)
        p.connect(sig_sweep, 0, v, IN_SWEEP)
        p.connect(sig_detune, 0, v, IN_DETUNE)
        p.connect(sig_stereo, 0, v, IN_STEREO)
        p.connect(sig_color, 0, v, IN_COLOR)
        voices.append(v)

    # ================= amplitude envelope & output ========================
    p.comment("--- envelope, tone, DC block, output ---", 20, 946, w=400)

    env = p.obj("adsr~ 20 120 0.85 700", 20, 1000, w=160)
    p.connect(midi, 1, env, 0)
    sig_drone = smooth(t_drone, 200, 974, ramp=50)
    env_sum = p.obj("+~", 20, 1036)
    env_clip = p.obj("clip~ 0. 1.", 20, 1072)
    p.connect(env, 0, env_sum, 0)
    p.connect(sig_drone, 0, env_sum, 1)
    p.connect(env_sum, 0, env_clip, 0)

    gain = p.obj("dbtoa", 380, 974)
    p.connect(d_volume, 0, gain, 0)
    sig_gain = smooth(gain, 380, 1010, ramp=30)

    out = p.obj("plugout~", 20, 1290)
    for i in range(2):
        x = 20.0 + i * 220.0
        amp = p.obj("*~ 0.", x, 1108)
        tone = p.obj("svf~ 9000. 0.2", x, 1144, w=120)
        dc_lp = p.obj("onepole~ 12", x + 130, 1180)
        dc = p.obj("-~", x, 1216)
        vol = p.obj("*~ 0.", x, 1240)
        # signals connected to the same inlet are summed by MSP
        for v in voices:
            p.connect(v, i, amp, 0)
        p.connect(env_clip, 0, amp, 1)
        p.connect(amp, 0, tone, 0)
        p.connect(d_tone, 0, tone, 1)
        p.connect(tone, 0, dc, 0)
        p.connect(tone, 0, dc_lp, 0)
        p.connect(dc_lp, 0, dc, 1)
        p.connect(dc, 0, vol, 0)
        p.connect(sig_gain, 0, vol, 1)
        p.connect(vol, 0, out, i)

    return {"patcher": p.to_dict()}


def main() -> None:
    device = build_device()
    ensure_amxd_project_block(device, device_type="instrument")
    text = json.dumps(device, indent=1, ensure_ascii=False)

    maxpat = HERE / "GrainImage.maxpat"
    maxpat.write_text(text, encoding="utf-8")

    blob = pack_amxd(text, device_type="instrument",
                     patcher_filename="GrainImage.maxpat")
    amxd = HERE / "GrainImage.amxd"
    amxd.write_bytes(blob)

    assert unpack_amxd(blob) == text.encode("utf-8"), "amxd round-trip failed"

    boxes = device["patcher"]["boxes"]
    print(f"{maxpat.name}: {len(text):,} bytes, {len(boxes)} top-level boxes")
    print(f"{amxd.name}:   {len(blob):,} bytes (instrument)")


if __name__ == "__main__":
    main()
