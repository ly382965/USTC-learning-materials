%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_AddSync.m
%  Description: ����ͬ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          data = ASK_AddSync(Preamble,Channel_Bit)
%  Parameter List:
%      Output Parameter:
%          data                   ����ͬ���������
%      Input Parameter:
%           Preamble          ͬ����
%           Channel_Bit     �ŵ����������
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function data = ASK_AddSync(Preamble,Channel_Bit)

data = [Preamble,Channel_Bit]; %����ͬ����
end