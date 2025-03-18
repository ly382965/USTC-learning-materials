%双线形变换法设计 chebyshev 高通滤波器
FS=1; T=1/FS;
wp=0.3*pi;
ws=0.2*pi;
OmegaP=2*tan(wp/2);
OmegaS=2*tan(ws/2);
[n1,Wn1]=cheb1ord(OmegaP,OmegaS,1,15,'s');
[b1,a1]=cheby1(n1,1,Wn1,'high','s');
%freqs(b,a) %设计模拟的
[bz,az]=bilinear(b,a,FS); %映射为数字的

% Matlab 使用归一化的频率参数（临界频率除以采样频率的 1/2）。
%这样临界频率参数的取值范围在 0 和 1 之间， 1 代表 Fs/2（用角频率表示的时候对应 π）
R=[5,10,15,20,40];
r=R(5);
T_w=0.1*pi; %过渡带宽
N=100;
W_p=2*pi*r/N;
W_s=W_p+T_w;
f_s=1;
[n,W_n]=buttord(W_p/pi,W_s/pi,1,40);
[b,a]=butter(n,W_n);

n=1:N*10;
x_n=[ones(1,N/2),zeros(1,N/2)];
X_n=repmat(x_n,1,10);%复制10次
Y_n=filter(b,a,X_n);
Y_pn=filter(bz,az,X_n);
FFT_Xn=fft(X_n);
FFT_Yn=fft(Y_pn);
FFT_Ypn=fft(Y_pn+Y_n);

subplot(2,3,1);
plot(1*N:5*N,X_n(1*N:5*N));
title(['X_n(r=' num2str(r) ')']);

subplot(2,3,2);
plot(1*N:5*N,Y_pn(1*N:5*N));
title(['Y_pn(r=' num2str(r) ')']);

subplot(2,3,3);
plot(1*N:5*N,Y_n(1*N:5*N)+Y_pn(1*N:5*N));
title(['Y_n+Y_{pn}(r=' num2str(r) ')']);

subplot(2,3,4);
plot(abs(FFT_Xn));
title(['FFT_{Xn}(r=' num2str(r) ')']);

subplot(2,3,5);
plot(abs(FFT_Yn));
title(['FFT_{Y_{pn}}(r=' num2str(r) ')']);

subplot(2,3,6);
plot(abs(FFT_Ypn));
title(['FFT_{Y_n+Y_{pn}}(r=' num2str(r) ')']);