%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_Channel.m
%   Description   : ASK系统的信道
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       rxSig = ASK_Channel(txSig,snr)
%   Parameter List:       
%       Output Parameter
%           output_data	  经过信道后信号
%       Input Parameter
%           txSig	  发送信号
%           snr         信噪比(dB)
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rxSig = ASK_Channel(txSig,snr)
txSig = real(txSig);
rxSig = awgn(txSig,snr,'measured');
rxSig = real(rxSig);
end