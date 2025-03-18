N1 = 1024; N2 = 2048;         
n1 = 0:N1-1; n2 = 0:N2-1;     
x2_N1 = 31.6*exp(1j*3*pi/7*n1) + 10*exp(1j*(1/7+1/1024)*3*pi*n1); % 信号 N = 1024
x2_N2 = 31.6*exp(1j*3*pi/7*n2) + 10*exp(1j*(1/7+1/1024)*3*pi*n2); % 信号 N = 2048

% Blackman窗
blackman_N1 = blackman(N1);   
blackman_N2 = blackman(N2);   

x2_N1_win = x2_N1 .* blackman_N1';
x2_N2_win = x2_N2 .* blackman_N2';

% FFT，零填充到 2N 点
X2_N1 = fft(x2_N1_win, 2*N1); 
X2_N2 = fft(x2_N2_win, 2*N2);

% 幅度谱 (dB)
X2_N1_mag = 20*log10(abs(X2_N1));
X2_N2_mag = 20*log10(abs(X2_N2));

freq_N1 = (0:2*N1-1)/(2*N1); 
freq_N2 = (0:2*N2-1)/(2*N2); 

figure;
subplot(2, 1, 1);
plot(freq_N1, X2_N1_mag);
title('Blackman窗幅度谱 (N = 1024)');
xlabel('归一化频率');
ylabel('幅度 (dB)');
grid on;

subplot(2, 1, 2);
plot(freq_N2, X2_N2_mag);
title('Blackman窗幅度谱 (N = 2048)');
xlabel('归一化频率');
ylabel('幅度 (dB)');
grid on;
