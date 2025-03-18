close all      
clear all      

% 设置序列的长度 n 和频率索引 k
n = 0:15;          
k = 0:15;          

% 定义信号
x_n = 2*sin(pi/4*n) + sin(5*pi/8*n) + 3*sin(3*pi/4*n);

% 计算DFT
DFT_xn = x_n * (exp(-1i * 2 * pi / 16)) .^ (n' * k); 

% 绘制DFT的幅频特性
subplot(3,1,1);     
stem(k, abs(DFT_xn)); 
title('16点DFT');    

% 设置FFT参数，N=16
L = 4;              
N = 16;             
r = zeros(1,16);    
x_m = [x_n; zeros(0,15); zeros(0,15); zeros(0,15); zeros(0,15)]; % 初始化信号矩阵

for j = 1:4          % 对每一层进行迭代，总共4层
    signal = (bitget(k, L-j+1));  
    k2 = bitrevorder(k);          % 获取频率索引的位逆序
    r = mod(k2, (2^(j-1)));       % 计算频率索引

    % 计算新的信号矩阵
    x_m(j+1,:) = (x_m(j,:) + (circshift(x_m(j,:), -2^(L-j))) .* exp(-1i * 2 * pi / (2^j) * r)) .* (1 - signal) + ...
                  ((circshift(x_m(j,:), 2^(L-j)) - x_m(j,:) .* exp(-1i * 2 * pi / (2^j) * r)) .* signal);
end

x_m(5,:)            % 输出第5层的结果（即最终的FFT结果）
FFT_xn = x_m(5, k2 + 1); % 通过位反转，将结果恢复为正确顺序

% 绘制FFT的幅频特性
subplot(3,1,2);     
stem(k, abs(FFT_xn)); 
title('16点FFT');   

% MATLAB标准FFT结果的幅频特性
subplot(3,1,3);     
stem(k, abs(fft(x_n))); 
title('标准FFT');   


