%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_UpSample.m
%   Description   : �����ϲ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       output_data= ASK_UpSample(input_data,UpSampleRate)
%   Parameter List:       
%       Output Parameter
%           output_data	  �ϲ���������
%       Input Parameter
%           input_data	  ����ͬ�����ı�������
%           UpSampleRate  һ����Ԫ�����ڵ�������
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  output_data= ASK_UpSample(input_data,UpSampleRate)

len = length(input_data);   %��ȡ����
output_data = zeros(1,len*UpSampleRate);
for n = 1:len
    output_data(1,(n-1)*UpSampleRate+1:n*UpSampleRate) = input_data(n);  %�ϲ���
end
