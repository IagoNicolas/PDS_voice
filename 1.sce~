clc;
clear;

fc = 5000
fs = 22100
M = 64
w = (2 * %pi)*(fc/fs)
wc = w/%pi
disp(wc)
[wft, wfm, fr] = wfir('hp', M+1, [wc/2.0], 're', [0, 0])
plot(2 * fr, wfm)
xlabel("Normalized digital frequency w")
ylabel("Magnitude |H(w)|")
title("Magnitude response of FIR High Pass")
xgrid(1)
