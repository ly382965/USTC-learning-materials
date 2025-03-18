%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FileName: ASK_DeChannelcode.m
%  Description: �ŵ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%        [output_data] = ASK_DeChannelcode(input_data,code_model,Gx,n,k)
%  Parameter List:
%     Output Parameter:
%        output_data                         �ŵ����������
%     Input Parameter:
%        input_data                             ȥͬ���������
%        code_model                             �ŵ����뷽ʽ
%        Gx                                    ѭ�������ɶ���ʽ
%        n                                      ���������鳤��
%        k                                      ��������Ϣλ����
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [output_data] = ASK_DeChannelcode(input_data, code_model, Gx, n, k)
    % ���� code_model ѡ�����뷽ʽ
    if code_model == 0  % ����������
        input_num = length(input_data);  % ��ȡ�������ݵĳ���
        group_num = floor(input_num / n); % ������Ҫ�ֳɶ�����
        output_data = zeros(1, group_num*k+input_num-n*group_num); % Ԥ�����������
        output_data(group_num*k+1:group_num*k+input_num-n*group_num)=input_data(group_num*n+1:input_num);
    
        % ���㴦��ʹ���ݳ��ȿ��Ա�n����
        input_data_aligned = input_data(1:group_num*n);
        % ����ÿһ�����ݽ�������
        for i = 1:group_num
            current_group = input_data_aligned((i-1) * n + 1:i*n);  % ��ǰ������
            if n == 7 && k == 4  % (7,4) ������
                % ����У��λ S3, S2, S1
                S3 = mod(current_group(1) + current_group(3) + current_group(4) + current_group(7), 2);
                S2 = mod(current_group(1) + current_group(2) + current_group(4) + current_group(6), 2);
                S1 = mod(current_group(1) + current_group(2) + current_group(3) + current_group(5), 2);

                s = 100 * S3 + 10 * S2 + 1 * S1;
                if s~=0
                    switch s
                        case 100
                            current_group(7) = mod(current_group(7) + 1, 2);  % ��ת����λ1
                        case 010
                            current_group(6) = mod(current_group(6) + 1, 2);  % ��ת����λ2
                        case 001
                            current_group(5) = mod(current_group(5) + 1, 2);  % ��ת����λ3
                        case 110
                            current_group(4) = mod(current_group(4) + 1, 2);  % ��ת����λ4
                        case 101
                            current_group(3) = mod(current_group(3) + 1, 2);  % ��ת����λ5
                        case 011
                            current_group(2) = mod(current_group(2) + 1, 2);  % ��ת����λ6
                        case 111
                            current_group(1) = mod(current_group(1) + 1, 2);  % ��ת����λ7
                        otherwise
                            %δ֪��У��λ���
                            disp('unknown error pattern');
                    end
                end
                    output_data((i-1) * k + 1:i * k) = current_group(1:k);  % ���ؾ��������Ϣλ          
            elseif n == 12 && k == 8  % (12,8) ������
                % ����У��λ S3, S2, S1, S0
                
                S3 = mod(current_group(1) + current_group(3) + current_group(5) + current_group(6) + current_group(9), 2);
                S2 = mod(current_group(1) + current_group(2) + current_group(4) + current_group(6) + current_group(7) + current_group(10), 2);
                S1 = mod(current_group(1) + current_group(2) + current_group(3) + current_group(5) + current_group(7) + current_group(8) + current_group(11), 2);
                S0 = mod(current_group(2) + current_group(4) + current_group(5) + current_group(8) + current_group(12), 2);
                
                s = 1000 * S3 + 100 * S2 + 10 * S1 + S0;
                if s~=0
                    switch s
                        case 0001
                            current_group(12) = mod(current_group(12) + 1, 2);  % ��ת����λ1
                        case 0010
                            current_group(11) = mod(current_group(11) + 1, 2);  % ��ת����λ2
                        case 0100
                            current_group(10) = mod(current_group(10) + 1, 2);  % ��ת����λ3
                        case 1000
                            current_group(9) = mod(current_group(9) + 1, 2);  % ��ת����λ4
                        case 0011
                            current_group(8) = mod(current_group(8) + 1, 2);  % ��ת����λ5
                        case 0110
                            current_group(7) = mod(current_group(7) + 1, 2);  % ��ת����λ6
                        case 1100
                            current_group(6) = mod(current_group(6) + 1, 2);  % ��ת����λ7
                        case 1011
                            current_group(5) = mod(current_group(5) + 1, 2);  % ��ת����λ8
                        case 0101
                            current_group(4) = mod(current_group(4) + 1, 2);  % ��ת����λ9
                        case 1010
                            current_group(3) = mod(current_group(3) + 1, 2); % ��ת����λ10
                        case 0111
                            current_group(2) = mod(current_group(2) + 1, 2); % ��ת����λ11
                        case 1110
                            current_group(1) = mod(current_group(1) + 1, 2); % ��ת����λ12
                        otherwise
                            % Ĭ������£��޴����⵽�����ߴ���δ֪��У��λ���
                            disp('unknown error pattern');
                    end
                end
                output_data((i-1) * k + 1:i * k) = current_group(1:k);  % ���ؾ��������Ϣλ
            else
                error('Invalid (n, k) for Hamming code.');
            end
        end
    elseif code_model == 1  % ѭ��������
        n=7;k=4;
        input_num = length(input_data);  % ��ȡ�������ݵĳ���
        group_num = floor(input_num / n); % ������Ҫ�ֳɶ�����
        output_data = zeros(1, group_num*k+input_num-n*group_num); % Ԥ�����������
        output_data(group_num*k+1:group_num*k+input_num-n*group_num)=input_data(group_num*n+1:input_num);
    
        % ���㴦��ʹ���ݳ��ȿ��Ա�n����
        input_data_aligned = input_data(1:group_num*n);
        % ����ÿһ�����ݽ�������
        for i = 1:group_num
            % ��ȡ��ǰ�������
            current_group = input_data_aligned((i - 1) * n + 1:i * n);
            % �������ʽ S(x)
            Sx = calculate_Sx(current_group, Gx);
            % �������ͼ�� E(x)
            Ex = calculate_Ex(Sx, Gx, n);
            % ���ô���ͼ����������
            corrected_data = mod(current_group + Ex, 2);
    
            % ��ȡ��Ϣλ
            output_data((i - 1) * k + 1:i * k) = corrected_data(1:k);
        end
    else
        error('Invalid code_model value. It must be 0 for Hamming code or 1 for Cyclic code.');
    end
end


function Sx = calculate_Sx(Rx, Gx)
    % �������ʽ S(x) = R(x) mod g(x)
    [~, remainder] = deconv(Rx, Gx);
    Sx = mod(remainder, 2); % ģ 2 ȡ��
end

function Ex = calculate_Ex(Sx, Gx, n)
    % ���ݰ���ʽ S(x) �������ͼ�� E(x)
    
    Ex = zeros(1, n);

    % �������ܵĴ���ͼ��
    for i = 1:n
        % ���쵥һ����ͼ��
        error_pattern = zeros(1, n);
        error_pattern(i) = 1;
        % �������ͼ���İ���ʽ
        error_syndrome = calculate_Sx(error_pattern, Gx);
        % ƥ�����ʽ
        if isequal(Sx, error_syndrome)
            Ex = error_pattern;
            break;
        end
    end
end

