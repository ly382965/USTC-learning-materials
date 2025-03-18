%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_Channel.m
%   Description   : ASKϵͳ���ŵ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       rxSig = ASK_Channel(txSig,snr)
%   Parameter List:       
%       Output Parameter
%           output_data	  �����ŵ����ź�
%       Input Parameter
%           txSig	  �����ź�
%           snr         �����(dB)
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rxSig = ASK_Channel(txSig,snr)
txSig = real(txSig);
rxSig = awgn(txSig,snr,'measured');
rxSig = real(rxSig);
end