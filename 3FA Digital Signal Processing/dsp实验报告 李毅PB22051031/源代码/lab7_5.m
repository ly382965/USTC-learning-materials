fs = 500;          % 采样频率
f_low = 100;       % 通带下边界
f_high = 200;      % 通带上边界
f0 = 150;          % 中心频率
delta_f = 10;      % 过渡带宽

f_low_norm = f_low / (fs / 2);          % 归一化下边界
f_high_norm = f_high / (fs / 2);        % 归一化上边界

figure;
N_total=[101,201,275,401];              % 滤波器阶数 (0.04pi=11pi/275)
for i=1:4
N = N_total(i);                               
b = fir1(N, [f_low_norm, f_high_norm], blackman(N+1)); % blackman窗设计

[H, f] = freqz(b, 1, 1024, 'whole',fs); % 计算幅频响应

subplot(2,2,i);
plot(f, abs(H));                       
title(sprintf("blackman窗设计,N=%d", N));
xlabel('频率 (Hz)');
ylabel('幅度归一化');
grid on;
end