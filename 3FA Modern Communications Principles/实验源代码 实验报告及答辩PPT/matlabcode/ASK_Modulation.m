%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_Modulation.m
%   Description   : ASK����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%       output_data = ASK_Modulation(input_data)
%   Parameter List:       
%       Output Parameter
%           output_data	  ��ASK���ƺ���ź�
%       Input Parameter
%           input_data	  ����������ź�
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function output_data = ASK_Modulation(input_data)
    %%%%% �����ݲ���30720�Ľ������
    N=30720;%Ŀ�곤��
    input_length = length(input_data); % ��ȡ�������ݳ���
    if input_length < N
        input_data = [input_data, zeros(1, N - input_length)]; % �������
    end
    
    %%%%% ���Ʋ�������
    fc = 2048;    % �ز�Ƶ��
    A = 1;        % �ز�����
    
    %%%%% �����ز��ź�����
    dt = 1 / N;               % ����ʱ����
    t = 0:dt:(N-1)*dt;         % ʱ������
    carrier_signal = exp(1j * 2*pi * fc * t); 
    
    %%%%% ���ƹ���
    output_data = zeros(1, N); 
    for i = 1:input_length
        if input_data(i) == 1
            output_data(i) = A * carrier_signal(i); % ��Ӧ����Ϊ1ʱ����
        else
            output_data(i) = 0; % ��Ӧ����Ϊ0ʱ����
        end
    end
end
