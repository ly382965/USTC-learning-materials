%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_PCMDecode.m
%  Description: PCM�������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           outData = ASK_PCMDecode(inputData)
%  Parameter List:
%      Output Parameter:d
%           outData         PCM���������
%      Input Parameter:
%           inputData              ��ԭ���һά����
%   History
%       1. Date        : 2022-3-3
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function outData = ASK_PCMDecode(inputData)

n = length(inputData);
outData = zeros(1,n/8);
MM = zeros(1,8);
for kk = 1:n/8
    MM(1:8) = inputData(1,(kk-1)*8+1:kk*8); %ȡ8λPCM��
    temp = MM(2)*2^2+MM(3)*2+MM(4);  %PCM���2~4λת��Ϊ10���ƣ������ж�����
    if temp==0
        q=1;
        a=0;
    end
    if temp==1
        q=1;
        a=16;
    end
    if temp==2
        q=2;
        a=32;
    end
    if temp==3
        q=4;
        a=64;
    end
    if temp==4
        q=8;
        a=128;
    end
    if temp==5
        q=16;
        a=256;
    end
    if temp==6
        q=32;
        a=512;
    end
    if temp==7
        q=64;
        a=1024;
    end
    
    R=(a+(MM(5)*2^3+MM(6)*2^2+MM(7)*2+MM(8)   )*q+q/2)/2048;
    if MM(1)==0  %�ж�����
        R=-R;
    end
        outData(1,kk) = R;
end
end