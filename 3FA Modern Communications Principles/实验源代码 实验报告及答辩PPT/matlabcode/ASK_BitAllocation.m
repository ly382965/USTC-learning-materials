%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FlieName:ASK_BitAllocation.m
%  Description:对数据进行分帧
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%         [FreData,paddingBits,bitLen] =ASK_BitAllocation(code_model,Origin_Bit,n,UpSampleRate)
%  Parameter List:
%     Output Parameter:
%        FreData                                二维数组，行数为帧数，列数为一帧的比特数据长度
%        paddingBits                         补1数据的长度，保证数据长度可以被一帧长度整除
%        bitLen                                   一帧的比特数据长度
%     Input Parameter:
%        code_model                        信道编码方式
%        Origin_Bit                             原始数据比特
%        n                                            汉明码编码时的码长
%        UpSampleRate                    一个码元周期内采样点数
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [FreData,paddingBits,bitLen] = ASK_BitAllocation(code_model,Origin_Bit,n,UpSampleRate)

%根据信道编码方式不同，选择不同的帧长度
if UpSampleRate == 10
    if code_model==0  %使用汉明码编码
        if n == 12
            bitLen = 1920;
        else
            bitLen = 1700;
        end
    else  %使用循环码进行编码
        bitLen = 1700;
    end
elseif UpSampleRate == 30
    if code_model==0  %使用汉明码编码
        if n == 12
            bitLen =640;
        else
            bitLen = 544;
        end
    else  %使用循环码进行编码
        bitLen = 544;
    end
end
    
 
%  规范数据长度，保证可以整除bitLen
if mod(length(Origin_Bit),bitLen) ~=0        %对数据取余，以确保是bitLen的整数倍
    paddingBits = bitLen - mod(length(Origin_Bit),bitLen);
    Origin_Bit = [Origin_Bit,ones(1,paddingBits)];
else
    paddingBits = 0;
end
% 重构矩阵的行与列数
frame_num = length(Origin_Bit)/bitLen;  %得到帧长度
FreData = reshape (Origin_Bit,bitLen,frame_num);   %将Origin_Bit数据变为bitLen行frame_num列的矩阵
FreData = FreData';
