%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_GenVioce.m
%  Description: 生成音频文件
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           pcm_dedata = ASK_GenVioce(input_data,sampleVal,filename)
%  Parameter List:
%      Output Parameter:
%           pcm_dedata         PCM译码后数据
%      Input Parameter:
%           input_data            还原后的一维数据
%           sampleVal            音频采样率
%           filename                写入文件名
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pcm_dedata = ASK_GenVioce(input_data,sampleVal,filename)


    %% 对语音数据进行解码（PCM译码）
    [pcm_dedata] = ASK_PCMDecode(input_data);
    
    %% 写入语音文件
    writeFilePath = filename;
    WriteVoiceData(writeFilePath,pcm_dedata,sampleVal);
    
end
    

