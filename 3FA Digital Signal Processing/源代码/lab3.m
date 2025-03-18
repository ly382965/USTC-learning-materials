close all
clear all
f_1=24;f_2=60;

syms t;
f_t1=exp(1j*2*pi*f_1*t)+exp(1j*2*pi*f_2*t);

syms w;
FT_t1=fourier(f_t1,w);

w1 = 0:pi/10:150*pi;
FT_t1n = subs(FT_t1, w, w1);

idx = (FT_t1n == inf);
FT_t1n(idx) = 1;

subplot(2,2,1);
plot(w1/(2*pi), abs(FT_t1n));
title('CFT');

T0=1/12;
w_0=2*pi/T0;
N=20;
FS_1 = zeros(1, N);
w2 = zeros(1, N);

for m = 1: N
    w2(m) = (m-1) * w_0;
    FS_1(m) = int(f_t1*exp(-1j * w2(m) * t), t, 0, T0) / T0;
end

subplot(2,2,2);
stem(w2/w_0, abs(FS_1),'filled');
title('CFS');

%R1矩形窗
R1 = heaviside(t) - heaviside(t-2*T0);
%R2矩形窗
R2 = heaviside(t) - heaviside(t-1.6*T0);

f_r1=f_t1*R1;
f_r2=f_t1*R2;

syms w;
FT_r1 = fourier(f_r1, w);
subplot(2, 2, 3);
fplot(w/(2*pi), abs(FT_r1), [0, 2 * 2*pi*f_2]);
title('CFT_R1');

syms w;
FT_r2 = fourier(f_r2, w);
subplot(2, 2, 4);
fplot(w/(2*pi), abs(FT_r2), [0, 2 * 2*pi*f_2]);
title('CFT_R2');

