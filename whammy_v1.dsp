declare name "Whammy V1 inspired";
declare version "1.0";
declare author "GitHub Copilot";
declare license "MIT";

import("stdfaust.lib");

window = 2048;
xfade = 128;

mode = hslider("Mode", 0, 0, 4, 1);
manual = hslider("Manual Pitch", 0, -12, 12, 0.1);
expression = hslider("Expression Pedal", 0, -1, 1, 0.001);
range = hslider("Range", 1, 0, 2, 0.01);
wet = hslider("Wet", 0.75, 0, 1, 0.01);
drive = hslider("Drive", 0, 0, 1, 0.01);
output = hslider("Output", 0.8, 0, 2, 0.01);

modeShift = ba.if(mode == 0, 0,
            ba.if(mode == 1, -12,
            ba.if(mode == 2, +12,
            ba.if(mode == 3, 7,
                               24))));

sweep = expression * (range * 12) + manual + modeShift;
shift = sweep + drive * 2;

preDrive(x) = x * (1 + drive * 2.5);
postTone(x) = x : fi.lowpass(1, 2200 + (drive * 7000));

monoWhammy(x) = x : preDrive : ef.transpose(window, xfade, shift) : postTone : *(wet) + x * (1 - wet) : *(output);

process = _,_ : (monoWhammy, monoWhammy);
