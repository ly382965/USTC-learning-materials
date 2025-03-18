N = 1024;                    
n = 0:N-1;                    
x1 = 31.6*exp(1j*3*pi/7*n) + 0.005*exp(1j*4*pi/5*n); % 信号

% 矩形窗
rect_win = boxcar(N);         
x1_rect = x1 .* rect_win';    
X1_rect = fft(x1_rect, 2*N);  
X1_rect_mag = 20*log10(abs(X1_rect)); % 幅度谱 (dB)

% Hamming 窗
hamming_win = hamming(N);     
x1_ham = x1 .* hamming_win';  
X1_ham = fft(x1_ham, 2*N);    
X1_ham_mag = 20*log10(abs(X1_ham)); % 幅度谱 (dB)

freq = (0:2*N-1)/(2*N);       % 归一化频率

figure;
subplot(2, 1, 1);
plot(freq, X1_rect_mag);
title('矩形窗幅度谱');
xlabel('归一化频率');
ylabel('幅度 (dB)');
grid on;

subplot(2, 1, 2);
plot(freq, X1_ham_mag);
title('Hamming窗幅度谱');
xlabel('归一化频率');
ylabel('幅度 (dB)');
grid on;
