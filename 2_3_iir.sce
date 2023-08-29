[x, fs, bits] = wavread('layla.wav');

// Projeto do filtro
N = 5;
delta = 0.1;
fc = 5000;
fdig = fc/fs;
 
Hz=iir(N,'hp','cheb1',[fdig fdig],[delta delta]);

// analise
[Xm,fr]=frmag(Hz,1000);
plot(fr*fs,Xm);

// filtragem
yr = flts(x(1,:),Hz);
yl = flts(x(2,:),Hz);

y = [yr;yl];

//playsnd(y,fs,bits);
savewave('filtered_cheb.wav',y , fs , bits);

Hz=iir(N,'hp','butt',[fdig fdig],[delta delta]);

// analise
[Xm,fr]=frmag(Hz,1000);
plot(fr*fs,Xm);

// filtragem
yr = flts(x(1,:),Hz);
yl = flts(x(2,:),Hz);

y = [yr;yl];

//playsnd(y,fs,bits);
savewave('filtered_butt.wav',y , fs , bits);
