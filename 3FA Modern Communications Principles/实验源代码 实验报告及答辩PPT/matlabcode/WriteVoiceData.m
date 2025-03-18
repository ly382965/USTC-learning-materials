%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: WriteVoiceData.m
%  Description: 写入音频文件
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           WriteVoiceData(filePath, input_data, sampleVal)
%  Parameter List:
%      Output Parameter:d
%           outData         PCM译码后数据
%      Input Parameter:
%           filePath          文件路径
%           input_data     PCM译码后数据
%           sampleVal     音频采样率
%   History
%       1. Date        : 2022-3-3
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  WriteVoiceData(filePath, input_data, sampleVal)


writeData=[ input_data; input_data]'; %复制声道1数据到声道2，并转置
% wavwrite(writeData,sampleVal,filePath);
audiowrite(filePath,writeData,sampleVal);


end