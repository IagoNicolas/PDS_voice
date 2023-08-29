[x, fs, bits] = wavread('layla.wav'); // Reading input file

// Filter parameters
N = 5;          // Filter order
delta = 0.1;    // Phase delay
fc = 5000;      // Cutoff frequency
fdig = fc/fs;   // Normalized cutoff frequency
 
Hz = iir(N, 'hp', 'cheb1', [fdig fdig], [delta delta]); // Filter design Chebyshev 1

[Xm, fr] = frmag(Hz, 1000);  // Magnitude IIR filter
plot(fr*fs, Xm);             // Plot of filter frequency response

// Filtering of both stereo tracks
yr = flts(x(1,:), Hz);  // Right side
yl = flts(x(2,:), Hz);  // Left side
y = [yr;yl];            // Putting both sides back

savewave('filtered_cheb.wav', y, fs, bits); // Generating output file for Chebyshev 1

Hz = iir(N, 'hp', 'butt', [fdig fdig], [delta delta]); // Filter design Butterworth

[Xm,fr] = frmag(Hz, 1000);   // Magnitude IIR filter
plot(fr*fs, Xm);             // Plot of filter frequency response

// Filtering of both stereo tracks
yr = flts(x(1,:), Hz);  // Right side
yl = flts(x(2,:), Hz);  // Left side
y = [yr;yl];            // Putting both sides back

savewave('filtered_butt.wav', y, fs, bits); // Generating output file for Butterworth
