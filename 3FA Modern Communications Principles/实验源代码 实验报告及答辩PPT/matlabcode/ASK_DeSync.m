%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FileName: ASK_DeSync.m
%  Description: ȥͬ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%        data1 = ASK_DeSync(judge_data,PreambleLen)
%  Parameter List:
%     Output Parameter:
%        data1                             ȥͬ���������
%     Input Parameter:
%        judge_data                     ����������
%        PreambleLen                 ͬ���볤��
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function data1 = ASK_DeSync(judge_data,PreambleLen) 

data1 = judge_data(PreambleLen+1:end);   %1~PreambleLenλΪͬ�������ݣ�PreambleLen֮������Ϊȥͬ�������� 
