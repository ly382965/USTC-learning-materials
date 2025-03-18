%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FileName: ASK_DeSync.m
%  Description: 去同步码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%        data1 = ASK_DeSync(judge_data,PreambleLen)
%  Parameter List:
%     Output Parameter:
%        data1                             去同步码后数据
%     Input Parameter:
%        judge_data                     抽样后数据
%        PreambleLen                 同步码长度
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function data1 = ASK_DeSync(judge_data,PreambleLen) 

data1 = judge_data(PreambleLen+1:end);   %1~PreambleLen位为同步码数据，PreambleLen之后数据为去同步码数据 
