"""`.amxd` (Max for Live device) binary container writer.

A `.amxd` file is a 36-byte header, followed by NUL-terminated UTF-8 patcher
JSON, followed by an IFF-style dependency-list trailer.

    offset  size  endian  value                    meaning
    0       4     -       "ampf"                   magic
    4       4     LE u32  4                        format version
    8       4     -       "aaaa"/"iiii"/"mmmm"     device type
    12      4     -       "ptch"                   top-level chunk id
    16      4     LE u32  file_size - 20           ptch payload size
    20      4     -       "mx@c"                   sub-block id
    24      4     BE u32  16                       constant
    28      4     BE u32  0                        flags
    32      4     BE u32  json_size + 16           mx@c content size
    36      N+1   -       <utf-8 json>\\x00        JSON, NUL-terminated

The trailer is a `dlst` chunk wrapping a `dire` chunk, which lists the
embedded patcher (name, size, offset, modification time). Every chunk is
`FOURCC + BE u32 size + payload`, where the size includes the 8-byte header
and payloads are padded to a 4-byte boundary.

The layout was reverse-engineered by the py2max project (MIT licensed,
https://github.com/shakfu/py2max, see py2max/m4l.py); this module is a
trimmed standalone copy so the build script has no third-party dependency.
"""

from __future__ import annotations

import struct
import time
from typing import Any, Dict, Optional, Union

_MAGIC = b"ampf"
_VERSION = 4
_PTCH_TAG = b"ptch"
_MXAC_TAG = b"mx@c"

_MXAC_CONST = 16
_MXAC_FLAGS = 0
_MXAC_PREAMBLE = 16  # bytes between the "mx@c" tag and the start of the JSON

_OF32_VALUE = 16
_VERS_VALUE = 0
_FLAG_VALUE = 17
_TYPE_PAYLOAD = b"JSON"

# Seconds between the Unix epoch (1970-01-01) and the classic Mac epoch
# (1904-01-01) that Max uses for its timestamps.
MAX_EPOCH_OFFSET = 2_082_844_800

DEVICE_TYPES: Dict[str, bytes] = {
    "audio_effect": b"aaaa",
    "instrument": b"iiii",
    "midi_effect": b"mmmm",
}


def unix_to_max_time(unix_seconds: Optional[float] = None) -> int:
    if unix_seconds is None:
        unix_seconds = time.time()
    return int(unix_seconds) + MAX_EPOCH_OFFSET


def _tag_for(device_type: str) -> bytes:
    try:
        return DEVICE_TYPES[device_type]
    except KeyError:
        raise ValueError(
            f"unknown device_type {device_type!r}; "
            f"expected one of {sorted(DEVICE_TYPES)}"
        ) from None


def _pad4(payload: bytes) -> bytes:
    return payload + b"\x00" * ((-len(payload)) % 4)


def _chunk(tag: bytes, payload: bytes) -> bytes:
    return tag + struct.pack(">I", 8 + len(payload)) + payload


def _u32_chunk(tag: bytes, value: int) -> bytes:
    return _chunk(tag, struct.pack(">I", value))


def ensure_amxd_project_block(
    patcher_dict: Dict[str, Any],
    device_type: str = "audio_effect",
    mtime: Optional[int] = None,
) -> Dict[str, Any]:
    """Add the embedded `project` block a self-contained .amxd needs.

    Without it Max refuses the device with "a project without a name is like
    a day without sunshine. fatal." `contents.patchers` stays empty so the
    device does not reference an external .maxproj.
    """
    inner = patcher_dict.get("patcher", patcher_dict)
    if "project" in inner:
        return patcher_dict
    if mtime is None:
        mtime = unix_to_max_time()
    inner["project"] = {
        "version": 1,
        "creationdate": mtime,
        "modificationdate": mtime,
        "viewrect": [0.0, 0.0, 300.0, 500.0],
        "autoorganize": 1,
        "hideprojectwindow": 1,
        "showdependencies": 1,
        "autolocalize": 0,
        "contents": {"patchers": {}},
        "layout": {},
        "searchpath": {},
        "detailsvisible": 0,
        "amxdtype": int(struct.unpack(">I", _tag_for(device_type))[0]),
        "readonly": 0,
        "devpathtype": 0,
        "devpath": ".",
        "sortmode": 0,
        "viewmode": 0,
        "includepackages": 0,
    }
    return patcher_dict


def pack_amxd(
    patcher_json: Union[str, bytes],
    device_type: str = "audio_effect",
    patcher_filename: str = "patcher.maxpat",
    mtime: Optional[int] = None,
) -> bytes:
    """Wrap patcher JSON in the .amxd binary container."""
    tag = _tag_for(device_type)
    json_bytes = (
        patcher_json.encode("utf-8")
        if isinstance(patcher_json, str)
        else patcher_json
    )
    json_block = json_bytes + b"\x00"

    if mtime is None:
        mtime = unix_to_max_time()

    dire_payload = b"".join(
        [
            _chunk(b"type", _TYPE_PAYLOAD),
            _chunk(b"fnam", _pad4(patcher_filename.encode("utf-8") + b"\x00")),
            _u32_chunk(b"sz32", len(json_block)),
            _u32_chunk(b"of32", _OF32_VALUE),
            _u32_chunk(b"vers", _VERS_VALUE),
            _u32_chunk(b"flag", _FLAG_VALUE),
            _u32_chunk(b"mdat", mtime),
        ]
    )
    dlst = _chunk(b"dlst", _chunk(b"dire", dire_payload))

    ptch_payload_size = 16 + len(json_block) + len(dlst)

    mxac_block = (
        _MXAC_TAG
        + struct.pack(">I", _MXAC_CONST)
        + struct.pack(">I", _MXAC_FLAGS)
        + struct.pack(">I", _MXAC_PREAMBLE + len(json_block))
        + json_block
    )

    header_top = _MAGIC + struct.pack("<I", _VERSION) + tag + _PTCH_TAG
    return header_top + struct.pack("<I", ptch_payload_size) + mxac_block + dlst


def unpack_amxd(data: bytes) -> bytes:
    """Return the patcher JSON bytes from an .amxd (round-trip check)."""
    if data[0:4] != _MAGIC:
        raise ValueError(f"not an amxd file (magic={data[0:4]!r})")
    version = struct.unpack("<I", data[4:8])[0]
    if version != _VERSION:
        raise ValueError(f"unsupported amxd version {version}")
    if data[12:16] != _PTCH_TAG or data[20:24] != _MXAC_TAG:
        raise ValueError("missing ptch/mx@c tag")
    mxac_content_size = struct.unpack(">I", data[32:36])[0]
    json_len = mxac_content_size - _MXAC_PREAMBLE
    return data[36 : 36 + json_len - 1]
