% (1) Butterworth 模型设计 IIR 低通滤波器

fp = 0.8;                  % 通带截止频率
fs = 0.9;                  % 止带起始频率
Ap = 1;                    % 通带起伏
As = 40;                   % 止带衰减

[N, Wn] = buttord(fp, fs, Ap, As);    
[IIR_b, IIR_a] = butter(N, Wn, 'low');        % 设计低通滤波器


figure(1);
freqz(IIR_b, IIR_a, 1024);                    % 绘制幅频和相频特性
title('Butterworth IIR 低通滤波器的幅频与相频特性');

figure(2);
grpdelay(IIR_b, IIR_a);                 % 绘制群时延特性
title('Butterworth IIR 低通滤波器的群时延');

% (2) FIR 滤波器设计低通滤波器

fp = 0.8;                 % 通带截止频率
delta_f = 0.1;            % 过渡带宽
fst = 0.9;                % 止带起始频率
As = 40;                  % 止带衰减

N=67;                            %(0.1pi=6.6pi/66)
FIR_b = fir1(N, fp, 'low');      % 默认 Hamming 窗

figure(3);
freqz(FIR_b, 1, 1024);                           % 绘制幅频和相频特性
title('FIR 低通滤波器的幅频与相频特性');

figure(4);
grpdelay(FIR_b, 1);                               % 绘制群时延特性
title('FIR 低通滤波器的群时延');

% (3)输入信号 x1(n) 和 x2(n)

N = 80;                              
n = 0:N-1;                                              
x1 = sin(0.1 * pi * n);                    
x2 = sin(0.7 * pi * n);                    

% 信号通过 IIR 滤波器
y1_iir = filter(IIR_b, IIR_a, x1);           
y2_iir = filter(IIR_b, IIR_a, x2);           

% 信号通过 FIR 滤波器
y1_fir = filter(FIR_b, 1, x1);           
y2_fir = filter(FIR_b, 1, x2);           

% 绘制时域波形
figure(5);
subplot(2, 1, 1);
stem(n, x1, 'g', 'DisplayName', '输入信号');
hold on;
stem(n, y1_iir, 'r', 'DisplayName', 'IIR 输出');
stem(n, y1_fir, 'b', 'DisplayName', 'FIR 输出');
legend;
title('x1 信号通过滤波器后的时域波形');

subplot(2, 1, 2);
stem(n, x2, 'g', 'DisplayName', '输入信号');
hold on;
stem(n, y2_iir, 'r', 'DisplayName', 'IIR 输出');
stem(n, y2_fir, 'b', 'DisplayName', 'FIR 输出');
legend;
title('x2 信号通过滤波器后的时域波形');

% (4)复合信号 x(n) = x1(n) + x2(n)
x = x1 + x2;         

% 信号通过 IIR 滤波器
y_iir = filter(IIR_b, IIR_a, x);             

% 信号通过 FIR 滤波器
y_fir = filter(FIR_b, 1, x);             

% 绘制时域波形
figure(6);

stem(n, x, 'g', 'DisplayName', '输入信号');
hold on;
stem(n, y_iir, 'r', 'DisplayName', 'IIR 输出');
stem(n, y_fir, 'b', 'DisplayName', 'FIR 输出');
legend;
title('复合信号通过滤波器后的时域波形');