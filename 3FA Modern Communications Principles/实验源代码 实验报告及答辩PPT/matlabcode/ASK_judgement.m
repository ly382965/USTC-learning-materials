%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_judgement.m
%   Description   : 抽样判决
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       judge_data = ASK_judgement(input_data,UpSampleRate)
%   Parameter List:       
%       Output Parameter
%           judge_data	       抽样判决后数据
%       Input Parameter
%           input_data	         帧同步后信号
%           UpSampleRate  一个码元周期内样点数
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function judge_data = ASK_judgement(input_data, UpSampleRate)
    % 抽样
    sampled_data = input_data(1:UpSampleRate:end);  % 每隔UpSampleRate抽一个
    len=length(sampled_data);
    judge_data = zeros(1, len);

    % 最大值
    max_data = max(abs(sampled_data));

    % 判决
    for i = 1:len
        if abs(sampled_data(i)) > 0.5 * max_data
            judge_data(i) = 1;
        else 
            judge_data(i) = 0;
        end
    end
end