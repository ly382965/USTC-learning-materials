close all
clear all
% Matlab 使用归一化的频率参数（临界频率除以采样频率的 1/2）。
%这样临界频率参数的取值范围在 0 和 1 之间， 1 代表 Fs/2（用角频率表示的时候对应 π）
R=[5,10,15,20,40];
for k=1:5
    r=R(k);
    T_w=0.1*pi; %过渡带宽
    N=100;
    W_p=2*pi*r/N;
    W_s=W_p+T_w;
    f_s=1;
    [n,W_n]=buttord(W_p/pi,W_s/pi,1,40);
    [b,a]=butter(n,W_n);
    %freqz(b,a,512,f_s);
    
    n=1:N*10;
    x_n=[ones(1,N/2),zeros(1,N/2)];
    X_n=repmat(x_n,1,10);%复制10次
    Y_n=filter(b,a,X_n);
    FFT_Xn=fft(X_n);
    FFT_Yn=fft(Y_n);
    
    subplot(5,4,4*k-3);
    plot(1*N:5*N,X_n(1*N:5*N));
    title(['X_n(r=' num2str(r) ')']);

    subplot(5,4,4*k-2);
    plot(1*N:5*N,Y_n(1*N:5*N));
    title(['Y_n(r=' num2str(r) ')']);

    subplot(5,4,4*k-1);
    plot(abs(FFT_Xn));
    title(['FFT_{Xn}(r=' num2str(r) ')']);

    subplot(5,4,4*k);
    plot(abs(FFT_Yn));
    title(['FFT_{Yn}(r=' num2str(r) ')']);
    
end

