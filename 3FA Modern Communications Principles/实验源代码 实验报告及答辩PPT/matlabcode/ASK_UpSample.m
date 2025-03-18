%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_UpSample.m
%   Description   : 数据上采样
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       output_data= ASK_UpSample(input_data,UpSampleRate)
%   Parameter List:       
%       Output Parameter
%           output_data	  上采样后数据
%       Input Parameter
%           input_data	  加入同步码后的比特数据
%           UpSampleRate  一个码元周期内的样点数
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  output_data= ASK_UpSample(input_data,UpSampleRate)

len = length(input_data);   %读取长度
output_data = zeros(1,len*UpSampleRate);
for n = 1:len
    output_data(1,(n-1)*UpSampleRate+1:n*UpSampleRate) = input_data(n);  %上采样
end
