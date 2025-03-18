close all
clear all
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
[H,w]=freqz(b,a);
plot(w/pi, 20*log10(abs(H)));
xlabel('\omega/\pi');
ylabel('幅值(dB)');