"""Minimal builder for Max/MSP patcher (.maxpat) JSON.

Only what the device generator needs: typed boxes, patch cords, embedded
subpatchers and Live parameter metadata.

A patcher is a dict with `boxes` and `lines`. Every box carries an `id`
(`obj-N`), and every patch cord references `[box_id, outlet_index]` /
`[box_id, inlet_index]`. Max validates those indices against the *instantiated*
object at load time, so `numinlets` / `numoutlets` here only need to be at
least as large as the indices actually used.
"""

from __future__ import annotations

from typing import Any, Dict, List, Optional, Sequence

APPVERSION = {
    "major": 8,
    "minor": 6,
    "revision": 0,
    "architecture": "x64",
    "modernui": 1,
}

# Objects whose inlet/outlet counts the generator relies on. Anything not
# listed must pass counts explicitly.
IO_COUNTS: Dict[str, Sequence[int]] = {
    # MSP
    "phasor~": (2, 1),
    "cycle~": (2, 1),
    "noise~": (1, 1),
    "delta~": (1, 1),
    "sah~": (3, 1),
    "*~": (2, 1),
    "+~": (2, 1),
    "-~": (2, 1),
    "/~": (2, 1),
    "<~": (2, 1),
    "minimum~": (2, 1),
    "maximum~": (2, 1),
    "clip~": (3, 1),
    "sig~": (1, 1),
    "line~": (2, 2),
    "adsr~": (5, 2),
    "onepole~": (2, 1),
    "svf~": (3, 4),
    "plugout~": (2, 0),
    # Jitter
    "jit.movie": (1, 3),
    "jit.matrix": (1, 2),
    "jit.unpack": (1, 5),
    "jit.pack": (2, 2),
    "jit.op": (2, 2),
    "jit.peek~": (2, 1),
    # Max
    "inlet": (0, 1),
    "outlet": (1, 0),
    "loadbang": (1, 1),
    "live.thisdevice": (1, 3),
    "notein": (1, 3),
    "stripnote": (2, 2),
    "mtof": (1, 1),
    "dbtoa": (1, 1),
    "f": (2, 1),
    "+": (2, 1),
    "*": (2, 1),
    "expr": (2, 1),
    "clip": (3, 1),
    "pack": (2, 1),
    "prepend": (2, 1),
    "gate": (2, 2),
    "regexp": (2, 3),
    "opendialog": (1, 2),
    "qmetro": (2, 1),
    "sel": (2, 2),
    "route": (2, 2),
}


class Patcher:
    """Accumulates boxes and patch cords for one patcher window."""

    def __init__(
        self,
        rect: Sequence[float] = (60.0, 100.0, 900.0, 620.0),
        openinpresentation: int = 0,
    ) -> None:
        self.rect = [float(v) for v in rect]
        self.openinpresentation = openinpresentation
        self.boxes: List[Dict[str, Any]] = []
        self.lines: List[Dict[str, Any]] = []
        self._n = 0

    # -- boxes ---------------------------------------------------------

    def _next_id(self) -> str:
        self._n += 1
        return f"obj-{self._n}"

    def _add(self, box: Dict[str, Any]) -> str:
        box_id = self._next_id()
        box["id"] = box_id
        self.boxes.append({"box": box})
        return box_id

    def obj(
        self,
        text: str,
        x: float,
        y: float,
        w: float = 0.0,
        numinlets: Optional[int] = None,
        numoutlets: Optional[int] = None,
        **extra: Any,
    ) -> str:
        """A regular object box (`newobj`)."""
        name = text.split()[0] if text.split() else text
        if numinlets is None or numoutlets is None:
            try:
                default_in, default_out = IO_COUNTS[name]
            except KeyError:
                raise KeyError(
                    f"no default inlet/outlet count for {name!r}; "
                    "pass numinlets= and numoutlets= explicitly"
                ) from None
            numinlets = default_in if numinlets is None else numinlets
            numoutlets = default_out if numoutlets is None else numoutlets
        if not w:
            w = max(40.0, 8.0 * len(text) + 16.0)
        box: Dict[str, Any] = {
            "maxclass": "newobj",
            "text": text,
            "numinlets": numinlets,
            "numoutlets": numoutlets,
            "patching_rect": [float(x), float(y), float(w), 22.0],
        }
        if numoutlets:
            box["outlettype"] = extra.pop("outlettype", [""] * numoutlets)
        box.update(extra)
        return self._add(box)

    def trigger(self, args: str, x: float, y: float) -> str:
        parts = args.split()
        return self.obj(
            f"t {args}", x, y, numinlets=1, numoutlets=len(parts)
        )

    def msg(self, text: str, x: float, y: float, w: float = 0.0, **extra: Any) -> str:
        box = {
            "maxclass": "message",
            "text": text,
            "numinlets": 2,
            "numoutlets": 1,
            "outlettype": [""],
            "patching_rect": [float(x), float(y), float(w or 8.0 * len(text) + 16.0), 22.0],
        }
        box.update(extra)
        return self._add(box)

    def comment(self, text: str, x: float, y: float, w: float = 200.0, **extra: Any) -> str:
        box = {
            "maxclass": "comment",
            "text": text,
            "numinlets": 1,
            "numoutlets": 0,
            "patching_rect": [float(x), float(y), float(w), 20.0],
        }
        box.update(extra)
        return self._add(box)

    def ui(
        self,
        maxclass: str,
        x: float,
        y: float,
        w: float,
        h: float,
        numinlets: int = 1,
        numoutlets: int = 2,
        **extra: Any,
    ) -> str:
        box: Dict[str, Any] = {
            "maxclass": maxclass,
            "numinlets": numinlets,
            "numoutlets": numoutlets,
            "patching_rect": [float(x), float(y), float(w), float(h)],
        }
        if numoutlets:
            box["outlettype"] = extra.pop("outlettype", [""] * numoutlets)
        box.update(extra)
        return self._add(box)

    def subpatcher(
        self,
        name: str,
        inner: "Patcher",
        x: float,
        y: float,
        numinlets: int,
        numoutlets: int,
        w: float = 0.0,
        **extra: Any,
    ) -> str:
        text = f"p {name}"
        box: Dict[str, Any] = {
            "maxclass": "newobj",
            "text": text,
            "numinlets": numinlets,
            "numoutlets": numoutlets,
            "outlettype": extra.pop("outlettype", ["signal"] * numoutlets),
            "patching_rect": [float(x), float(y), float(w or 8.0 * len(text) + 24.0), 22.0],
            "patcher": inner.to_dict(),
        }
        box.update(extra)
        return self._add(box)

    # -- cords ---------------------------------------------------------

    def connect(self, src: str, outlet: int, dst: str, inlet: int) -> None:
        self.lines.append(
            {
                "patchline": {
                    "destination": [dst, inlet],
                    "source": [src, outlet],
                }
            }
        )

    def chain(self, *nodes: str) -> str:
        """Connect outlet 0 -> inlet 0 down a list of boxes."""
        for a, b in zip(nodes, nodes[1:]):
            self.connect(a, 0, b, 0)
        return nodes[-1]

    # -- output --------------------------------------------------------

    def to_dict(self) -> Dict[str, Any]:
        return {
            "fileversion": 1,
            "appversion": dict(APPVERSION),
            "classnamespace": "box",
            "rect": list(self.rect),
            "bglocked": 0,
            "openinpresentation": self.openinpresentation,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "gridonopen": 1,
            "gridsize": [15.0, 15.0],
            "gridsnaponopen": 1,
            "objectsnaponopen": 1,
            "statusbarvisible": 2,
            "toolbarvisible": 1,
            "lefttoolbarpinned": 0,
            "toptoolbarpinned": 0,
            "righttoolbarpinned": 0,
            "bottomtoolbarpinned": 0,
            "toolbars_unpinned_last_save": 0,
            "tallnewobj": 0,
            "boxanimatetime": 200,
            "enablehscroll": 1,
            "enablevscroll": 1,
            "devicewidth": 0.0,
            "description": "",
            "digest": "",
            "tags": "",
            "style": "",
            "subpatcher_template": "",
            "assistshowspatchername": 0,
            "boxes": self.boxes,
            "lines": self.lines,
            "dependency_cache": [],
            "autosave": 0,
        }


# -- Live parameter helpers ---------------------------------------------

# parameter_type: 0 float, 1 int, 2 enum, 3 blob
# parameter_unitstyle: 0 int, 1 float, 2 ms, 3 Hz, 4 dB, 5 %, 6 pan,
#                      7 semitones, 8 MIDI, 9 custom, 10 native


def live_param(
    longname: str,
    shortname: str,
    ptype: int = 0,
    mmin: float = 0.0,
    mmax: float = 1.0,
    initial: float = 0.0,
    unitstyle: int = 1,
    exponent: Optional[float] = None,
    enum: Optional[Sequence[str]] = None,
    modmode: int = 0,
) -> Dict[str, Any]:
    valueof: Dict[str, Any] = {
        "parameter_longname": longname,
        "parameter_shortname": shortname,
        "parameter_type": ptype,
        "parameter_mmin": mmin,
        "parameter_mmax": mmax,
        "parameter_initial": [initial],
        "parameter_initial_enable": 1,
        "parameter_unitstyle": unitstyle,
        "parameter_modmode": modmode,
    }
    if exponent is not None:
        valueof["parameter_exponent"] = exponent
    if enum is not None:
        valueof["parameter_enum"] = list(enum)
    return {"valueof": valueof}
