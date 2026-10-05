# Whammy V1-inspired Faust pedal

This project contains a Faust DSP inspired by the classic Whammy V1 used by Tom Morello: a dramatic pitch-shifting pedal with selectable direction, a manual pitch offset, expression-pedal sweep, range control, and wet/dry mix.

Files:
- `whammy_v1.dsp` — the DSP source
- `compile_whammy.sh` — helper script to export the code to C++

Controls:
- `Mode` — normal, down, up, detune, octave
- `Manual Pitch` — fixed semitone offset
- `Expression Pedal` — dynamic pitch sweep
- `Range` — total pitch range
- `Wet` — effect intensity
- `Drive` — extra saturation and harmonic richness
- `Output` — final level

Compile:

```bash
cd /workspaces/whammy
./compile_whammy.sh
```

Or directly:

```bash
faust -o /tmp/whammy_v1.cpp whammy_v1.dsp
```

This is an original Faust recreation inspired by the Whammy V1 behavior, designed for guitar-style experimentation in the Faust environment.
