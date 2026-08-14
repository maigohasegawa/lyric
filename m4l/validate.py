#!/usr/bin/env python3
"""Structural checks on the generated patcher.

Max silently drops patch cords whose inlet/outlet index does not exist, which
is very hard to spot by eye in a device this size. This walks every patcher
and subpatcher and reports:

  * cords referencing an unknown box id
  * cords whose outlet/inlet index exceeds the box's declared count
  * boxes that nothing connects to and that connect to nothing
  * duplicate Live parameter names (Live refuses the device)
  * inlet/outlet objects in a subpatcher whose left-to-right order does not
    match the parent box's inlet/outlet count

    python3 m4l/validate.py
"""

from __future__ import annotations

import json
import sys
from pathlib import Path
from typing import Any, Dict, List

HERE = Path(__file__).resolve().parent

# Boxes that legitimately sit on their own.
STANDALONE = {"comment", "live.thisdevice", "dropfile"}

problems: List[str] = []
param_names: Dict[str, str] = {}


def label(box: Dict[str, Any]) -> str:
    return box.get("text") or box.get("maxclass", "?")


def check_patcher(patcher: Dict[str, Any], path: str) -> None:
    boxes = {}
    for entry in patcher.get("boxes", []):
        box = entry["box"]
        boxes[box["id"]] = box

    # duplicate Live parameter names
    for box in boxes.values():
        saved = box.get("saved_attribute_attributes", {}).get("valueof", {})
        name = saved.get("parameter_longname")
        if name:
            if name in param_names:
                problems.append(
                    f"{path}: duplicate Live parameter {name!r} "
                    f"({param_names[name]} and {box['id']})"
                )
            param_names[name] = f"{path}/{box['id']}"

    used_out = set()
    used_in = set()
    for entry in patcher.get("lines", []):
        line = entry["patchline"]
        src_id, out_i = line["source"]
        dst_id, in_i = line["destination"]

        for box_id, side in ((src_id, "source"), (dst_id, "destination")):
            if box_id not in boxes:
                problems.append(f"{path}: cord {side} references unknown box {box_id}")

        if src_id in boxes:
            n = boxes[src_id].get("numoutlets", 0)
            if not 0 <= out_i < n:
                problems.append(
                    f"{path}: {label(boxes[src_id])!r} ({src_id}) has {n} outlet(s), "
                    f"cord uses outlet {out_i}"
                )
            used_out.add(src_id)
        if dst_id in boxes:
            n = boxes[dst_id].get("numinlets", 0)
            if not 0 <= in_i < n:
                problems.append(
                    f"{path}: {label(boxes[dst_id])!r} ({dst_id}) has {n} inlet(s), "
                    f"cord uses inlet {in_i}"
                )
            used_in.add(dst_id)

    for box_id, box in boxes.items():
        cls = box.get("maxclass")
        if cls in STANDALONE:
            continue
        if box_id not in used_out and box_id not in used_in:
            problems.append(f"{path}: {label(box)!r} ({box_id}) is not connected")

    # subpatchers: inlet/outlet objects must match the parent box's counts
    for box_id, box in boxes.items():
        inner = box.get("patcher")
        if not inner:
            continue
        sub = f"{path}/{box.get('text', box_id)}"
        n_in = sum(
            1 for e in inner["boxes"] if e["box"].get("text") == "inlet"
        )
        n_out = sum(
            1 for e in inner["boxes"] if e["box"].get("text") == "outlet"
        )
        if n_in != box.get("numinlets"):
            problems.append(
                f"{path}: {box.get('text')} declares {box.get('numinlets')} inlets "
                f"but the subpatcher has {n_in} inlet objects"
            )
        if n_out != box.get("numoutlets"):
            problems.append(
                f"{path}: {box.get('text')} declares {box.get('numoutlets')} outlets "
                f"but the subpatcher has {n_out} outlet objects"
            )
        check_patcher(inner, sub)


def main() -> int:
    source = HERE / "GrainImage.maxpat"
    device = json.loads(source.read_text(encoding="utf-8"))
    check_patcher(device["patcher"], "device")

    if problems:
        print(f"{len(problems)} problem(s):")
        for line in problems:
            print(f"  - {line}")
        return 1

    n_params = len(param_names)
    print(f"{source.name}: OK ({n_params} Live parameters)")
    for name in sorted(param_names):
        print(f"  {name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
