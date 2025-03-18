%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_DeModulation.m
%   Description   : ASK解调
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          data = ASK_DeModulation(input_data)
%   Parameter List:       
%       Output Parameter
%           data	           解调后信号
%       Input Parameter
%           input_data     经信道传输后的信号
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 0.1 
%           Modification: 初稿
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function data = ASK_DeModulation(input_data)

    N = 30720;                % 帧样点数据长度
    Rs = 3072;                % 截止频率
    fc = 2048;                % 载波频率

    % 对数据长度标准化
    if length(input_data) < N
        input_data = [input_data, zeros(1, N - length(input_data))]; % 补零
    elseif length(input_data) > N
        input_data = input_data(1:N); % 截取
    end

    % 本地载波
    dt = 1 / N;               
    t = 0:dt:(N-1)*dt;         
    carrier_signal = cos(2 * pi * fc * t); % 实数载波信号

    % 相干解调：信号点乘载波
    demodulated_signal = input_data .* carrier_signal;

    % 低通滤波器（频域）
    freq_axis = (-N/2:N/2-1);            % 频率轴
    lpf = abs(freq_axis) <= Rs;          % 理想低通滤波器：通带为 [-Rs, Rs]

    % 时域信号通过FFT变换到频域信号
    fft_signal = fftshift(fft(demodulated_signal));

    % 低通滤波
    data_freq = fft_signal .* lpf;

    % 频域信号IFFT变换得到时域信号
    data = ifft(ifftshift(data_freq), 'symmetric');

end