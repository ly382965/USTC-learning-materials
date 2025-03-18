%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FileName      : ASK_DeModulation.m
%   Description   : ASK���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          data = ASK_DeModulation(input_data)
%   Parameter List:       
%       Output Parameter
%           data	           ������ź�
%       Input Parameter
%           input_data     ���ŵ��������ź�
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 0.1 
%           Modification: ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function data = ASK_DeModulation(input_data)

    N = 30720;                % ֡�������ݳ���
    Rs = 3072;                % ��ֹƵ��
    fc = 2048;                % �ز�Ƶ��

    % �����ݳ��ȱ�׼��
    if length(input_data) < N
        input_data = [input_data, zeros(1, N - length(input_data))]; % ����
    elseif length(input_data) > N
        input_data = input_data(1:N); % ��ȡ
    end

    % �����ز�
    dt = 1 / N;               
    t = 0:dt:(N-1)*dt;         
    carrier_signal = cos(2 * pi * fc * t); % ʵ���ز��ź�

    % ��ɽ�����źŵ���ز�
    demodulated_signal = input_data .* carrier_signal;

    % ��ͨ�˲�����Ƶ��
    freq_axis = (-N/2:N/2-1);            % Ƶ����
    lpf = abs(freq_axis) <= Rs;          % �����ͨ�˲�����ͨ��Ϊ [-Rs, Rs]

    % ʱ���ź�ͨ��FFT�任��Ƶ���ź�
    fft_signal = fftshift(fft(demodulated_signal));

    % ��ͨ�˲�
    data_freq = fft_signal .* lpf;

    % Ƶ���ź�IFFT�任�õ�ʱ���ź�
    data = ifft(ifftshift(data_freq), 'symmetric');

end