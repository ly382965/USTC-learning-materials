close all
clear all
syms t;
f_h=100;
f_x1 = sin(2*pi*f_h*t)/t;
FT_x1 = fourier(f_x1); % Fourier transform
figure(1);
subplot(2,1,1); hold on;
fplot(f_x1,[-1,1]) % 绘制
xlabel('t');
ylabel('幅度');

title('原信号');
subplot(2,1,2); hold on;
fplot(abs(FT_x1),[-1200,1200]);
xlabel('频率 (Hz)');
ylabel('幅度归一化');

title('连续傅里叶变换 CFT');
figure(2);
freq=[0.6,1.2,1.8,2.4,4,8];
for l=1:6
    n=-50:50; % 定义采样点范围
    f_s= freq(l)*f_h; % 采样频率
    T=1/f_s; % 采样周期
    f_x1n=sin(2*pi*f_h*n*T)./(n*T); % 理想采样信号序列
    
    % 处理 n=0 时的情况，避免 0/0 的不定值问题
    f_x1n(n==0) = 2*pi*f_h;
    
    %DTFT
    DTFT_fx1n=zeros(1,1001);
    w=-pi:2*pi/1000:pi;
    for i=1:1000
        for k=1:101
            DTFT_fx1n(i)=DTFT_fx1n(i)+f_x1n(k)*exp(-1i*w(i)*(k-51));
        end
    end
    max1=max(abs(DTFT_fx1n));
    subplot(2,3,l);
    plot(w/(2*pi),abs(DTFT_fx1n)/max1);
    title(['DTFT ' num2str(freq(l)*f_h) 'HZ']);
    xlabel('频率归一化');
    ylabel('幅度归一化');
end



