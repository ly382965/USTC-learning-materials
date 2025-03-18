%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: e_coding.m
%  Description: 非均匀量化编码的过程
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          [ four ]=e_coding(Is,q,a)
%  Parameter List:
%     Output Parameter:
%           four:         一个样点的后四位编码后数据
%     Input Parameter
%           Is:             第m点取绝对值后的样值
%           q              段内量化间隔
%           a              段内起始电平
%   History
%       1. Date        : 2022-3-4
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%16级量化编码函数
function [ four ]=e_coding(Is,q,a)
four=zeros(1,4);
for k=1:16
    if Is>a+(k-1)*q && Is<=a+k*q  %选择对应最接近整数进行量化
        four=dec2bin(k-1,4);
        four=str2num(four(:))';%数据对应的四位二进制数组
    else
    end
end

end


