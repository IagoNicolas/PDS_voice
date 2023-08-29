[x, fs, bits] = wavread('layla.wav'); // Reading input file

// Filter parameters
fc = 5000;               // Cutoff frequency
fs = 22100;              // Sampling response
M = 64;                  // Number of points (Order) 64 =< M =< 32768
w = (2 * %pi)*(fc/fs);   // Angular frequency
wc = w/%pi;              // Phase shift angle

// Filter design High-Pass
[wft, wfm, fr] = wfir('hp', M+1, [wc/2.0], 're', [0, 0]);
Hz=syslin('d',poly(wft,'z','c')./%z**33);

// Frequency response plot of an ideal filter
plot(2 * fr, wfm);
xlabel("Normalized digital frequency w");
ylabel("Magnitude |H(w)|");
title("Magnitude response of FIR High Pass");
xgrid(1);

// Filtering of both stereo tracks
yr = flts(x(1,:), Hz);  // Right side
yl = flts(x(2,:), Hz);  // Left side
y = [yr;yl];            // Putting both sides back

savewave('filtered_fir.wav', y, fs, bits); // Generating output file for Butterworth
