%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: e_coding.m
%  Description: �Ǿ�����������Ĺ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          [ four ]=e_coding(Is,q,a)
%  Parameter List:
%     Output Parameter:
%           four:         һ������ĺ���λ���������
%     Input Parameter
%           Is:             ��m��ȡ����ֵ�����ֵ
%           q              �����������
%           a              ������ʼ��ƽ
%   History
%       1. Date        : 2022-3-4
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%16���������뺯��
function [ four ]=e_coding(Is,q,a)
four=zeros(1,4);
for k=1:16
    if Is>a+(k-1)*q && Is<=a+k*q  %ѡ���Ӧ��ӽ�������������
        four=dec2bin(k-1,4);
        four=str2num(four(:))';%���ݶ�Ӧ����λ����������
    else
    end
end

end


