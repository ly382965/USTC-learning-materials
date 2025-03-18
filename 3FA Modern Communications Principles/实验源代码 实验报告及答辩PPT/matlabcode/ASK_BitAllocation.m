%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FlieName:ASK_BitAllocation.m
%  Description:�����ݽ��з�֡
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%         [FreData,paddingBits,bitLen] =ASK_BitAllocation(code_model,Origin_Bit,n,UpSampleRate)
%  Parameter List:
%     Output Parameter:
%        FreData                                ��ά���飬����Ϊ֡��������Ϊһ֡�ı������ݳ���
%        paddingBits                         ��1���ݵĳ��ȣ���֤���ݳ��ȿ��Ա�һ֡��������
%        bitLen                                   һ֡�ı������ݳ���
%     Input Parameter:
%        code_model                        �ŵ����뷽ʽ
%        Origin_Bit                             ԭʼ���ݱ���
%        n                                            ���������ʱ���볤
%        UpSampleRate                    һ����Ԫ�����ڲ�������
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [FreData,paddingBits,bitLen] = ASK_BitAllocation(code_model,Origin_Bit,n,UpSampleRate)

%�����ŵ����뷽ʽ��ͬ��ѡ��ͬ��֡����
if UpSampleRate == 10
    if code_model==0  %ʹ�ú��������
        if n == 12
            bitLen = 1920;
        else
            bitLen = 1700;
        end
    else  %ʹ��ѭ������б���
        bitLen = 1700;
    end
elseif UpSampleRate == 30
    if code_model==0  %ʹ�ú��������
        if n == 12
            bitLen =640;
        else
            bitLen = 544;
        end
    else  %ʹ��ѭ������б���
        bitLen = 544;
    end
end
    
 
%  �淶���ݳ��ȣ���֤��������bitLen
if mod(length(Origin_Bit),bitLen) ~=0        %������ȡ�࣬��ȷ����bitLen��������
    paddingBits = bitLen - mod(length(Origin_Bit),bitLen);
    Origin_Bit = [Origin_Bit,ones(1,paddingBits)];
else
    paddingBits = 0;
end
% �ع��������������
frame_num = length(Origin_Bit)/bitLen;  %�õ�֡����
FreData = reshape (Origin_Bit,bitLen,frame_num);   %��Origin_Bit���ݱ�ΪbitLen��frame_num�еľ���
FreData = FreData';
