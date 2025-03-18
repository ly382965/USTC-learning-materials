%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_GenVioce.m
%  Description: ������Ƶ�ļ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           pcm_dedata = ASK_GenVioce(input_data,sampleVal,filename)
%  Parameter List:
%      Output Parameter:
%           pcm_dedata         PCM���������
%      Input Parameter:
%           input_data            ��ԭ���һά����
%           sampleVal            ��Ƶ������
%           filename                д���ļ���
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pcm_dedata = ASK_GenVioce(input_data,sampleVal,filename)


    %% ���������ݽ��н��루PCM���룩
    [pcm_dedata] = ASK_PCMDecode(input_data);
    
    %% д�������ļ�
    writeFilePath = filename;
    WriteVoiceData(writeFilePath,pcm_dedata,sampleVal);
    
end
    

