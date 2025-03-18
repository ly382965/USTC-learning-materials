%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_judgement.m
%   Description   : �����о�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       judge_data = ASK_judgement(input_data,UpSampleRate)
%   Parameter List:       
%       Output Parameter
%           judge_data	       �����о�������
%       Input Parameter
%           input_data	         ֡ͬ�����ź�
%           UpSampleRate  һ����Ԫ������������
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function judge_data = ASK_judgement(input_data, UpSampleRate)
    % ����
    sampled_data = input_data(1:UpSampleRate:end);  % ÿ��UpSampleRate��һ��
    len=length(sampled_data);
    judge_data = zeros(1, len);

    % ���ֵ
    max_data = max(abs(sampled_data));

    % �о�
    for i = 1:len
        if abs(sampled_data(i)) > 0.5 * max_data
            judge_data(i) = 1;
        else 
            judge_data(i) = 0;
        end
    end
end