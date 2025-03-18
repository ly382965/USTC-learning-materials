%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_DeSync.m
%   Description   : ����֡ͷ��λ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       out_data = ASK_DeSync(input_data,SendSig,UpSampleRate,code_model,Preamble,PreambleLen)
%   Parameter List:       
%       Output Parameter
%           output_data	  ��ASK���ƺ���ź�
%       Input Parameter
%           input_data	  �˲����ź�
%           UpSampleRate  һ����Ԫ������������
%           bitLen            ��Դ����һ֡�ĳ���
%           n                     ����������鳤��
%           crc_num        CRCУ������볤
%           code_model  �ŵ����뷽ʽ   0��������  1����ѭ����
%           Preamble      ͬ����
%           PreambleLen  ͬ����ĳ���
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output_data = ASK_Sync(input_data, UpSampleRate, bitLen, n, crc_num, code_model, Preamble, PreambleLen)

    % ��ͬ����תΪ�����루1��1��0��-1��
    PreamblePolar = 2 * Preamble - 1;
  
    % ����������س���
    if code_model == 0
        if n == 7
            len = floor((bitLen + crc_num) / 4) * 7 + mod(bitLen + crc_num, 4) + PreambleLen;
        elseif n == 12
            len = floor((bitLen + crc_num) / 8) * 12 + mod(bitLen + crc_num, 8) + PreambleLen;
        else
            error('Unsupported n.');
        end
    elseif code_model == 1
        len = floor((bitLen + crc_num) / 4) * 7 + mod(bitLen + crc_num, 4) + PreambleLen;
    else
        error('Unsupported code_model.');
    end
    
    % �����������ݽ��и���һ��
    input_data = [input_data, input_data];
    % ��������
    N= 30720;
    % ��ʼ�����ϵ������
    cov =zeros(1,N);
    for i= 1:length(input_data)/2
    % ���������
    cov(i)= abs(sum(input_data(i:UpSampleRate:i + PreambleLen*UpSampleRate-1).*PreamblePolar));
    end
    % ѡȡ���ϵ������λ����Ϊ֡ͷ����ȡlen*UpsampleRate������
    [~, max_position]= max(cov);
    output_data = input_data(1, max_position:max_position + len * UpSampleRate- 1);
end