%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_DeSync.m
%   Description   : 搜索帧头的位置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       out_data = ASK_DeSync(input_data,SendSig,UpSampleRate,code_model,Preamble,PreambleLen)
%   Parameter List:       
%       Output Parameter
%           output_data	  经ASK调制后的信号
%       Input Parameter
%           input_data	  滤波后信号
%           UpSampleRate  一个码元周期内样点数
%           bitLen            信源数据一帧的长度
%           n                     汉明码的码组长度
%           crc_num        CRC校验码的码长
%           code_model  信道编码方式   0代表汉明码  1代表循环码
%           Preamble      同步码
%           PreambleLen  同步码的长度
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output_data = ASK_Sync(input_data, UpSampleRate, bitLen, n, crc_num, code_model, Preamble, PreambleLen)

    % 将同步码转为极性码（1变1，0变-1）
    PreamblePolar = 2 * Preamble - 1;
  
    % 计算编码后比特长度
    if code_model == 0
        if n == 7
            len = floor((bitLen + crc_num) / 4) * 7 + mod(bitLen + crc_num, 4) + PreambleLen;
        elseif n == 12
            len = floor((bitLen + crc_num) / 8) * 12 + mod(bitLen + crc_num, 8) + PreambleLen;
        else
            error('Unsupported n.');
        end
    elseif code_model == 1
        len = floor((bitLen + crc_num) / 4) * 7 + mod(bitLen + crc_num, 4) + PreambleLen;
    else
        error('Unsupported code_model.');
    end
    
    % 将解调后的数据进行复制一份
    input_data = [input_data, input_data];
    % 搜索长度
    N= 30720;
    % 初始化相关系数数组
    cov =zeros(1,N);
    for i= 1:length(input_data)/2
    % 计算相关性
    cov(i)= abs(sum(input_data(i:UpSampleRate:i + PreambleLen*UpSampleRate-1).*PreamblePolar));
    end
    % 选取相关系数最大的位置作为帧头，截取len*UpsampleRate个数据
    [~, max_position]= max(cov);
    output_data = input_data(1, max_position:max_position + len * UpSampleRate- 1);
end