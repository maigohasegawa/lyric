{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 6,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   59.0,
   104.0,
   588.0,
   168.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "default_fontsize": 12.0,
  "default_fontface": 0,
  "default_fontname": "Arial",
  "gridonopen": 1,
  "gridsize": [
   15.0,
   15.0
  ],
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
  "boxes": [
   {
    "box": {
     "maxclass": "comment",
     "text": "GRAIN IMAGE",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      20.0,
      140.0,
      20.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      2.0,
      140.0,
      18.0
     ],
     "fontsize": 11.0,
     "id": "obj-1"
    }
   },
   {
    "box": {
     "maxclass": "jit.pwindow",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      50.0,
      116.0,
      88.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      20.0,
      116.0,
      88.0
     ],
     "id": "obj-2"
    }
   },
   {
    "box": {
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      20.0,
      150.0,
      56.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "mode": 0,
     "text": "IMAGE",
     "presentation": 1,
     "presentation_rect": [
      6.0,
      112.0,
      56.0,
      20.0
     ],
     "id": "obj-3"
    }
   },
   {
    "box": {
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      84.0,
      150.0,
      56.0,
      20.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "mode": 0,
     "text": "VIDEO",
     "presentation": 1,
     "presentation_rect": [
      66.0,
      112.0,
      56.0,
      20.0
     ],
     "id": "obj-4"
    }
   },
   {
    "box": {
     "maxclass": "dropfile",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      180.0,
      116.0,
      26.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      136.0,
      116.0,
      26.0
     ],
     "id": "obj-5"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      200.0,
      20.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Position",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      132.0,
      22.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Position",
       "parameter_shortname": "Pos",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-6"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      260.0,
      20.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Scan",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      184.0,
      22.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Scan",
       "parameter_shortname": "Scan",
       "parameter_type": 0,
       "parameter_mmin": -2.0,
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-7"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      320.0,
      20.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Spray",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      236.0,
      22.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Spray",
       "parameter_shortname": "Spray",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.15
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-8"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      20.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Grain",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      288.0,
      22.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Grain",
       "parameter_shortname": "Grain",
       "parameter_type": 0,
       "parameter_mmin": 5.0,
       "parameter_mmax": 500.0,
       "parameter_initial": [
        90.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_modmode": 0,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-9"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      440.0,
      20.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Density",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      340.0,
      22.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Density",
       "parameter_shortname": "Dens",
       "parameter_type": 0,
       "parameter_mmin": 0.5,
       "parameter_mmax": 40.0,
       "parameter_initial": [
        12.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 3,
       "parameter_modmode": 0,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-10"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      500.0,
      20.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Pitch",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      392.0,
      22.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Pitch",
       "parameter_shortname": "Pitch",
       "parameter_type": 0,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 7,
       "parameter_modmode": 0
      }
     },
     "id": "obj-11"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      560.0,
      20.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Detune",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      444.0,
      22.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Detune",
       "parameter_shortname": "Det",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.06
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-12"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      200.0,
      90.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Sweep",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      132.0,
      96.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Sweep",
       "parameter_shortname": "Sweep",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.12
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-13"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      260.0,
      90.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Color",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      184.0,
      96.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Color",
       "parameter_shortname": "Color",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.6
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-14"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      320.0,
      90.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Stereo",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      236.0,
      96.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Stereo",
       "parameter_shortname": "Stereo",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.7
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-15"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      90.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Tone",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      288.0,
      96.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tone",
       "parameter_shortname": "Tone",
       "parameter_type": 0,
       "parameter_mmin": 200.0,
       "parameter_mmax": 18000.0,
       "parameter_initial": [
        9000.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 3,
       "parameter_modmode": 0,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-16"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      440.0,
      90.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Contrast",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      340.0,
      96.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Contrast",
       "parameter_shortname": "Cont",
       "parameter_type": 0,
       "parameter_mmin": 0.2,
       "parameter_mmax": 4.0,
       "parameter_initial": [
        1.6
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_modmode": 0
      }
     },
     "id": "obj-17"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      500.0,
      90.0,
      48.0,
      48.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Volume",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      392.0,
      96.0,
      48.0,
      48.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Volume",
       "parameter_shortname": "Vol",
       "parameter_type": 0,
       "parameter_mmin": -70.0,
       "parameter_mmax": 6.0,
       "parameter_initial": [
        -12.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_modmode": 0
      }
     },
     "id": "obj-18"
    }
   },
   {
    "box": {
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      560.0,
      90.0,
      48.0,
      18.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Note",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      444.0,
      112.0,
      48.0,
      18.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Note",
       "parameter_shortname": "Note",
       "parameter_type": 1,
       "parameter_mmin": 24.0,
       "parameter_mmax": 84.0,
       "parameter_initial": [
        48.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_modmode": 0
      }
     },
     "id": "obj-19"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "NOTE",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      560.0,
      70.0,
      48.0,
      20.0
     ],
     "presentation": 1,
     "presentation_rect": [
      444.0,
      96.0,
      48.0,
      16.0
     ],
     "fontsize": 9.0,
     "id": "obj-20"
    }
   },
   {
    "box": {
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      630.0,
      20.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Drone",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      504.0,
      30.0,
      20.0,
      20.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Drone",
       "parameter_shortname": "Drone",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_modmode": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-21"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "DRONE",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      630.0,
      44.0,
      60.0,
      20.0
     ],
     "presentation": 1,
     "presentation_rect": [
      500.0,
      52.0,
      60.0,
      16.0
     ],
     "fontsize": 9.0,
     "id": "obj-22"
    }
   },
   {
    "box": {
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      630.0,
      90.0,
      20.0,
      20.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "varname": "Live",
     "parameter_enable": 1,
     "presentation": 1,
     "presentation_rect": [
      504.0,
      96.0,
      20.0,
      20.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Live",
       "parameter_shortname": "Live",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_modmode": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-23"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "LIVE",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      630.0,
      114.0,
      60.0,
      20.0
     ],
     "presentation": 1,
     "presentation_rect": [
      500.0,
      118.0,
      60.0,
      16.0
     ],
     "fontsize": 9.0,
     "id": "obj-24"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "--- file loading: video goes to jit.movie, everything else is imported as a still ---",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      214.0,
      520.0,
      20.0
     ],
     "id": "obj-25"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      270.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-26"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "opendialog",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      306.0,
      96.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-27"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      140.0,
      270.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-28"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "opendialog",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      140.0,
      306.0,
      96.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-29"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t s s s",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      260.0,
      240.0,
      72.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "id": "obj-30"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      260.0,
      276.0,
      24.0,
      22.0
     ],
     "id": "obj-31"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "regexp (mp4|mov|m4v|avi|mkv|webm|MP4|MOV|M4V|AVI|MKV|WEBM)$",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      360.0,
      276.0,
      380.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "id": "obj-32"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      360.0,
      312.0,
      24.0,
      22.0
     ],
     "id": "obj-33"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gate 2",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      260.0,
      348.0,
      64.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-34"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b s",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      380.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-35"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend importmovie",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      140.0,
      412.0,
      168.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-36"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix ---load 4 char 256 256",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      470.0,
      250.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-37"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend read",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      420.0,
      412.0,
      112.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-38"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.movie @autostart 1 @loop 1",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      420.0,
      470.0,
      220.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "id": "obj-39"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "qmetro 25",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      660.0,
      412.0,
      88.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-40"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "--- picture to wavetables: red -> left plane, blue -> right plane, 0..1 remapped to -1..1 ---",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      510.0,
      560.0,
      20.0
     ],
     "id": "obj-41"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix ---rgb 4 char 256 256 @interp 1",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      540.0,
      300.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-42"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.unpack 4",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      20.0,
      576.0,
      112.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "id": "obj-43"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.pack 2",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      612.0,
      96.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-44"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix ---f32 2 float32 256 256",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      648.0,
      280.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-45"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.op @op - @val 0.5",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      684.0,
      180.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-46"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.op @op * @val 1.6",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      720.0,
      180.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-47"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix ---wav 2 float32 256 256",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      756.0,
      280.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-48"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend val",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      220.0,
      684.0,
      104.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-49"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "--- control signals ---",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      780.0,
      240.0,
      200.0,
      20.0
     ],
     "id": "obj-50"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      780.0,
      270.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-51"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      780.0,
      320.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-52"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      780.0,
      346.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-53"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      780.0,
      380.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-54"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      780.0,
      406.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-55"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      780.0,
      440.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-56"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      780.0,
      466.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-57"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      780.0,
      500.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-58"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      780.0,
      526.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-59"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      780.0,
      560.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-60"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      780.0,
      586.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-61"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "f 90",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      960.0,
      270.0,
      48.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-62"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b f",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1060.0,
      240.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-63"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "expr $f1 * $f2 * 0.001",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      960.0,
      306.0,
      180.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-64"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "clip 0.02 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      960.0,
      342.0,
      112.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-65"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      960.0,
      378.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-66"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      960.0,
      404.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-67"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "notein",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1240.0,
      240.0,
      64.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "id": "obj-68"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "stripnote",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1240.0,
      276.0,
      88.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-69"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "f 48",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1240.0,
      312.0,
      48.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-70"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b f",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1340.0,
      276.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-71"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1240.0,
      348.0,
      48.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-72"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "mtof",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1240.0,
      384.0,
      48.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-73"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1240.0,
      420.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-74"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1240.0,
      446.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-75"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "--- 8 grain streams, evenly staggered in phase ---",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      790.0,
      400.0,
      20.0
     ],
     "id": "obj-76"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "live.thisdevice",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      460.0,
      812.0,
      120.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "id": "obj-77"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0.0",
     "numinlets": 1,
     "numoutlets": 8,
     "patching_rect": [
      20.0,
      844.0,
      360.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "id": "obj-78"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-79"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      20.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-80"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      170.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-81"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      170.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-82"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      320.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-83"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      320.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-84"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      470.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-85"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      470.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-86"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      620.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-87"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      620.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-88"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      770.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-89"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      770.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-90"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      920.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-91"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      920.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-92"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1070.0,
      880.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-93"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p ig.grain",
     "numinlets": 9,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      1070.0,
      920.0,
      110.0,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       40.0,
       80.0,
       1120.0,
       760.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
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
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "grain phase 0-1",
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "oscillator frequency (Hz)",
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          200.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "duty / grain length 0-1",
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          290.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row position 0-1",
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          380.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "position spray 0-1",
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          470.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "row sweep per grain 0-1",
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "detune 0-1",
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          650.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "stereo spread 0-1",
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          740.0,
          20.0,
          34.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "comment": "colour separation 0-1",
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "grain start = phasor~ wrap",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "delta~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "<~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          164.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "per-grain randoms",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          80.0,
          160.0,
          20.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-14"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-15"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-16"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-17"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-18"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-19"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "noise~",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          122.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-20"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "sah~ 0.5",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          164.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-21"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "oscillator",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-22"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-23"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          374.0,
          56.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-24"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-25"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "phasor~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          458.0,
          96.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-26"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 256.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          500.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-27"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          542.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-28"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "row position",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          185.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-29"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-30"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          374.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-31"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-32"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          458.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-33"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-34"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          542.0,
          80.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-35"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 255.0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          584.0,
          128.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-36"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "maximum~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          185.0,
          626.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-37"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "read picture: red / blue",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          350.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-38"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 0",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          332.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-39"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "jit.peek~ ---wav 2 1",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          374.0,
          150.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-40"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          416.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-41"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          458.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-42"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-43"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-44"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          350.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-45"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "-~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          500.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-46"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          542.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-47"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          515.0,
          584.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-48"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "Hann window",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          680.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-49"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "/~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-50"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "minimum~ 1.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          374.0,
          104.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-51"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          416.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-52"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ -0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-53"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          680.0,
          500.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-54"
        }
       },
       {
        "box": {
         "maxclass": "comment",
         "text": "equal-power pan",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          845.0,
          290.0,
          160.0,
          20.0
         ],
         "id": "obj-55"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          332.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-56"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          374.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-57"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.5",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          416.0,
          64.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-58"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~ 0.25",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          458.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-59"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "+~ 0.75",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          500.0,
          72.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-60"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          542.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-61"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "cycle~ 0.",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          845.0,
          584.0,
          88.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-62"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-63"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-64"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "left",
         "id": "obj-65"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          660.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-66"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "*~",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          220.0,
          692.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "id": "obj-67"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          220.0,
          726.0,
          34.0,
          22.0
         ],
         "comment": "right",
         "id": "obj-68"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-11",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-12",
          0
         ],
         "source": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          0
         ],
         "source": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-15",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          0
         ],
         "source": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-17",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          0
         ],
         "source": [
          "obj-18",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-19",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          0
         ],
         "source": [
          "obj-20",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-21",
          1
         ],
         "source": [
          "obj-12",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          0
         ],
         "source": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-23",
          1
         ],
         "source": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-24",
          0
         ],
         "source": [
          "obj-23",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          0
         ],
         "source": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-25",
          1
         ],
         "source": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-26",
          0
         ],
         "source": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-27",
          0
         ],
         "source": [
          "obj-26",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-28",
          0
         ],
         "source": [
          "obj-27",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-30",
          1
         ],
         "source": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          0
         ],
         "source": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-31",
          1
         ],
         "source": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          0
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-32",
          1
         ],
         "source": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-33",
          1
         ],
         "source": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          0
         ],
         "source": [
          "obj-31",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-34",
          1
         ],
         "source": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-35",
          0
         ],
         "source": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-36",
          0
         ],
         "source": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-37",
          0
         ],
         "source": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-39",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          0
         ],
         "source": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-40",
          1
         ],
         "source": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-41",
          1
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-42",
          0
         ],
         "source": [
          "obj-41",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          0
         ],
         "source": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-43",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          0
         ],
         "source": [
          "obj-43",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-44",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          0
         ],
         "source": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-45",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          0
         ],
         "source": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-46",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          0
         ],
         "source": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-47",
          1
         ],
         "source": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          0
         ],
         "source": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-48",
          1
         ],
         "source": [
          "obj-42",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-50",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-51",
          0
         ],
         "source": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-52",
          1
         ],
         "source": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-53",
          0
         ],
         "source": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-54",
          0
         ],
         "source": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          0
         ],
         "source": [
          "obj-8",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-56",
          1
         ],
         "source": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-57",
          0
         ],
         "source": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-58",
          0
         ],
         "source": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-59",
          0
         ],
         "source": [
          "obj-58",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-60",
          0
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-61",
          1
         ],
         "source": [
          "obj-59",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-62",
          1
         ],
         "source": [
          "obj-60",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          0
         ],
         "source": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-63",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          0
         ],
         "source": [
          "obj-63",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-64",
          1
         ],
         "source": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-65",
          0
         ],
         "source": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          0
         ],
         "source": [
          "obj-48",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-66",
          1
         ],
         "source": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          0
         ],
         "source": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-67",
          1
         ],
         "source": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-68",
          0
         ],
         "source": [
          "obj-67",
          0
         ]
        }
       }
      ],
      "dependency_cache": [],
      "autosave": 0
     },
     "id": "obj-94"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "--- envelope, tone, DC block, output ---",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      946.0,
      400.0,
      20.0
     ],
     "id": "obj-95"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "adsr~ 20 120 0.85 700",
     "numinlets": 5,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      1000.0,
      160.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-96"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 50",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      200.0,
      974.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-97"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      200.0,
      1000.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-98"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      1036.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-99"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "clip~ 0. 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      1072.0,
      104.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-100"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "dbtoa",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      974.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-101"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0. 30",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      380.0,
      1010.0,
      96.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-102"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      380.0,
      1036.0,
      56.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "id": "obj-103"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "plugout~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      1290.0,
      80.0,
      22.0
     ],
     "id": "obj-104"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      1108.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-105"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "svf~ 9000. 0.2",
     "numinlets": 3,
     "numoutlets": 4,
     "patching_rect": [
      20.0,
      1144.0,
      120.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "id": "obj-106"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "onepole~ 12",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      150.0,
      1180.0,
      104.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-107"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "-~",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      1216.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-108"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      1240.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-109"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      240.0,
      1108.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-110"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "svf~ 9000. 0.2",
     "numinlets": 3,
     "numoutlets": 4,
     "patching_rect": [
      240.0,
      1144.0,
      120.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "id": "obj-111"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "onepole~ 12",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      370.0,
      1180.0,
      104.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-112"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "-~",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      240.0,
      1216.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-113"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      240.0,
      1240.0,
      56.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "id": "obj-114"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "obj-26",
      0
     ],
     "source": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-27",
      0
     ],
     "source": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-28",
      0
     ],
     "source": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-29",
      0
     ],
     "source": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-30",
      0
     ],
     "source": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-31",
      0
     ],
     "source": [
      "obj-30",
      2
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-34",
      0
     ],
     "source": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-32",
      0
     ],
     "source": [
      "obj-30",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-33",
      0
     ],
     "source": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-34",
      0
     ],
     "source": [
      "obj-33",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-34",
      1
     ],
     "source": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-35",
      0
     ],
     "source": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-35",
      0
     ],
     "source": [
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-36",
      0
     ],
     "source": [
      "obj-35",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-37",
      0
     ],
     "source": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-37",
      0
     ],
     "source": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-38",
      0
     ],
     "source": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-38",
      0
     ],
     "source": [
      "obj-34",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-39",
      0
     ],
     "source": [
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-40",
      0
     ],
     "source": [
      "obj-23",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-39",
      0
     ],
     "source": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-42",
      0
     ],
     "source": [
      "obj-37",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-42",
      0
     ],
     "source": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-2",
      0
     ],
     "source": [
      "obj-42",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-43",
      0
     ],
     "source": [
      "obj-42",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-44",
      0
     ],
     "source": [
      "obj-43",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-44",
      1
     ],
     "source": [
      "obj-43",
      3
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-45",
      0
     ],
     "source": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-46",
      0
     ],
     "source": [
      "obj-45",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-47",
      0
     ],
     "source": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-48",
      0
     ],
     "source": [
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-49",
      0
     ],
     "source": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-47",
      0
     ],
     "source": [
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-51",
      0
     ],
     "source": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-51",
      1
     ],
     "source": [
      "obj-6",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-52",
      0
     ],
     "source": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-53",
      0
     ],
     "source": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-54",
      0
     ],
     "source": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-55",
      0
     ],
     "source": [
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-56",
      0
     ],
     "source": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-57",
      0
     ],
     "source": [
      "obj-56",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-58",
      0
     ],
     "source": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-59",
      0
     ],
     "source": [
      "obj-58",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-60",
      0
     ],
     "source": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-61",
      0
     ],
     "source": [
      "obj-60",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-62",
      0
     ],
     "source": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-63",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-64",
      1
     ],
     "source": [
      "obj-63",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-62",
      0
     ],
     "source": [
      "obj-63",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-64",
      0
     ],
     "source": [
      "obj-62",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-65",
      0
     ],
     "source": [
      "obj-64",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-66",
      0
     ],
     "source": [
      "obj-65",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-67",
      0
     ],
     "source": [
      "obj-66",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-69",
      0
     ],
     "source": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-69",
      1
     ],
     "source": [
      "obj-68",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-70",
      0
     ],
     "source": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-70",
      0
     ],
     "source": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-71",
      0
     ],
     "source": [
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-72",
      1
     ],
     "source": [
      "obj-71",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-70",
      0
     ],
     "source": [
      "obj-71",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-72",
      0
     ],
     "source": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-73",
      0
     ],
     "source": [
      "obj-72",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-74",
      0
     ],
     "source": [
      "obj-73",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-75",
      0
     ],
     "source": [
      "obj-74",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-78",
      0
     ],
     "source": [
      "obj-77",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-79",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-79",
      1
     ],
     "source": [
      "obj-78",
      7
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      0
     ],
     "source": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-80",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-81",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-81",
      1
     ],
     "source": [
      "obj-78",
      6
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      0
     ],
     "source": [
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-82",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-83",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-83",
      1
     ],
     "source": [
      "obj-78",
      5
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      0
     ],
     "source": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-84",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-85",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-85",
      1
     ],
     "source": [
      "obj-78",
      4
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      0
     ],
     "source": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-86",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-87",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-87",
      1
     ],
     "source": [
      "obj-78",
      3
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      0
     ],
     "source": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-88",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-89",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-89",
      1
     ],
     "source": [
      "obj-78",
      2
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      0
     ],
     "source": [
      "obj-89",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-90",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-91",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-91",
      1
     ],
     "source": [
      "obj-78",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      0
     ],
     "source": [
      "obj-91",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-92",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-93",
      0
     ],
     "source": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-93",
      1
     ],
     "source": [
      "obj-78",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      0
     ],
     "source": [
      "obj-93",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      1
     ],
     "source": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      2
     ],
     "source": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      3
     ],
     "source": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      4
     ],
     "source": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      5
     ],
     "source": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      6
     ],
     "source": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      7
     ],
     "source": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-94",
      8
     ],
     "source": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-96",
      0
     ],
     "source": [
      "obj-68",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-97",
      0
     ],
     "source": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-98",
      0
     ],
     "source": [
      "obj-97",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-99",
      0
     ],
     "source": [
      "obj-96",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-99",
      1
     ],
     "source": [
      "obj-98",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-100",
      0
     ],
     "source": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-101",
      0
     ],
     "source": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-102",
      0
     ],
     "source": [
      "obj-101",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-103",
      0
     ],
     "source": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-82",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-86",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-88",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-90",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-92",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      0
     ],
     "source": [
      "obj-94",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-105",
      1
     ],
     "source": [
      "obj-100",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-106",
      0
     ],
     "source": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-106",
      1
     ],
     "source": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-108",
      0
     ],
     "source": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-107",
      0
     ],
     "source": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-108",
      1
     ],
     "source": [
      "obj-107",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-109",
      0
     ],
     "source": [
      "obj-108",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-109",
      1
     ],
     "source": [
      "obj-103",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-104",
      0
     ],
     "source": [
      "obj-109",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-80",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-82",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-84",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-86",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-88",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-90",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-92",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      0
     ],
     "source": [
      "obj-94",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-110",
      1
     ],
     "source": [
      "obj-100",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-111",
      0
     ],
     "source": [
      "obj-110",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-111",
      1
     ],
     "source": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-113",
      0
     ],
     "source": [
      "obj-111",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-112",
      0
     ],
     "source": [
      "obj-111",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-113",
      1
     ],
     "source": [
      "obj-112",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-114",
      0
     ],
     "source": [
      "obj-113",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-114",
      1
     ],
     "source": [
      "obj-103",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-104",
      1
     ],
     "source": [
      "obj-114",
      0
     ]
    }
   }
  ],
  "dependency_cache": [],
  "autosave": 0,
  "project": {
   "version": 1,
   "creationdate": 3869521811,
   "modificationdate": 3869521811,
   "viewrect": [
    0.0,
    0.0,
    300.0,
    500.0
   ],
   "autoorganize": 1,
   "hideprojectwindow": 1,
   "showdependencies": 1,
   "autolocalize": 0,
   "contents": {
    "patchers": {}
   },
   "layout": {},
   "searchpath": {},
   "detailsvisible": 0,
   "amxdtype": 1768515945,
   "readonly": 0,
   "devpathtype": 0,
   "devpath": ".",
   "sortmode": 0,
   "viewmode": 0,
   "includepackages": 0
  }
 }
}