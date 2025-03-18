%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_Modulation.m
%   Description   : ASK调制
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       output_data = ASK_Modulation(input_data)
%   Parameter List:       
%       Output Parameter
%           output_data	  经ASK调制后的信号
%       Input Parameter
%           input_data	  输入待调制信号
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function output_data = ASK_Modulation(input_data)
    %%%%% 对数据不满30720的进行填充
    N=30720;%目标长度
    input_length = length(input_data); % 获取输入数据长度
    if input_length < N
        input_data = [input_data, zeros(1, N - input_length)]; % 用零填充
    end
    
    %%%%% 调制参数设置
    fc = 2048;    % 载波频率
    A = 1;        % 载波幅度
    
    %%%%% 复数载波信号生成
    dt = 1 / N;               % 计算时间间隔
    t = 0:dt:(N-1)*dt;         % 时间序列
    carrier_signal = exp(1j * 2*pi * fc * t); 
    
    %%%%% 调制过程
    output_data = zeros(1, N); 
    for i = 1:input_length
        if input_data(i) == 1
            output_data(i) = A * carrier_signal(i); % 对应比特为1时调制
        else
            output_data(i) = 0; % 对应比特为0时调制
        end
    end
end
