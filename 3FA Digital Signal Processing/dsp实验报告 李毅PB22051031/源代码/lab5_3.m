%双线形变换法设计 chebyshev 高通滤波器
wp=0.3*pi;
FS=1;
ws=0.2*pi;
OmegaP=2*tan(wp/2);
OmegaS=2*tan(ws/2);
[n,Wn]=cheb1ord(OmegaP,OmegaS,1,15,'s');
[b,a]=cheby1(n,1,Wn,'high','s');
%freqs(b,a) %设计模拟的
[bz,az]=bilinear(b,a,FS); %映射为数字的
[H,w]=freqz(bz,az);
plot(w/pi, 20*log10(abs(H)));
xlabel('\omega/\pi');
ylabel('幅值(dB)');