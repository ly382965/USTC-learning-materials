%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_AddSync.m
%  Description: 加入同步码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          data = ASK_AddSync(Preamble,Channel_Bit)
%  Parameter List:
%      Output Parameter:
%          data                   加入同步码后数据
%      Input Parameter:
%           Preamble          同步码
%           Channel_Bit     信道编码后数据
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function data = ASK_AddSync(Preamble,Channel_Bit)

data = [Preamble,Channel_Bit]; %加入同步码
end