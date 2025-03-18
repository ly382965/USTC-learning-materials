%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: WriteVoiceData.m
%  Description: д����Ƶ�ļ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           WriteVoiceData(filePath, input_data, sampleVal)
%  Parameter List:
%      Output Parameter:d
%           outData         PCM���������
%      Input Parameter:
%           filePath          �ļ�·��
%           input_data     PCM���������
%           sampleVal     ��Ƶ������
%   History
%       1. Date        : 2022-3-3
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  WriteVoiceData(filePath, input_data, sampleVal)


writeData=[ input_data; input_data]'; %��������1���ݵ�����2����ת��
% wavwrite(writeData,sampleVal,filePath);
audiowrite(filePath,writeData,sampleVal);


end