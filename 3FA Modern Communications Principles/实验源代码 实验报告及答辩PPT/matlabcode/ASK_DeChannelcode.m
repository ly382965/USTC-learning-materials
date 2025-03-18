%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FileName: ASK_DeChannelcode.m
%  Description: 信道译码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%        [output_data] = ASK_DeChannelcode(input_data,code_model,Gx,n,k)
%  Parameter List:
%     Output Parameter:
%        output_data                         信道译码后数据
%     Input Parameter:
%        input_data                             去同步码后数据
%        code_model                             信道编码方式
%        Gx                                    循环码生成多项式
%        n                                      汉明码码组长度
%        k                                      汉明码信息位长度
%   History
%       1. Date        : 2022-3-2
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [output_data] = ASK_DeChannelcode(input_data, code_model, Gx, n, k)
    % 根据 code_model 选择译码方式
    if code_model == 0  % 汉明码译码
        input_num = length(input_data);  % 获取输入数据的长度
        group_num = floor(input_num / n); % 计算需要分成多少组
        output_data = zeros(1, group_num*k+input_num-n*group_num); % 预分配输出数据
        output_data(group_num*k+1:group_num*k+input_num-n*group_num)=input_data(group_num*n+1:input_num);
    
        % 补零处理，使数据长度可以被n整除
        input_data_aligned = input_data(1:group_num*n);
        % 遍历每一组数据进行译码
        for i = 1:group_num
            current_group = input_data_aligned((i-1) * n + 1:i*n);  % 当前组数据
            if n == 7 && k == 4  % (7,4) 汉明码
                % 计算校验位 S3, S2, S1
                S3 = mod(current_group(1) + current_group(3) + current_group(4) + current_group(7), 2);
                S2 = mod(current_group(1) + current_group(2) + current_group(4) + current_group(6), 2);
                S1 = mod(current_group(1) + current_group(2) + current_group(3) + current_group(5), 2);

                s = 100 * S3 + 10 * S2 + 1 * S1;
                if s~=0
                    switch s
                        case 100
                            current_group(7) = mod(current_group(7) + 1, 2);  % 翻转错误位1
                        case 010
                            current_group(6) = mod(current_group(6) + 1, 2);  % 翻转错误位2
                        case 001
                            current_group(5) = mod(current_group(5) + 1, 2);  % 翻转错误位3
                        case 110
                            current_group(4) = mod(current_group(4) + 1, 2);  % 翻转错误位4
                        case 101
                            current_group(3) = mod(current_group(3) + 1, 2);  % 翻转错误位5
                        case 011
                            current_group(2) = mod(current_group(2) + 1, 2);  % 翻转错误位6
                        case 111
                            current_group(1) = mod(current_group(1) + 1, 2);  % 翻转错误位7
                        otherwise
                            %未知的校验位组合
                            disp('unknown error pattern');
                    end
                end
                    output_data((i-1) * k + 1:i * k) = current_group(1:k);  % 返回纠正后的信息位          
            elseif n == 12 && k == 8  % (12,8) 汉明码
                % 计算校验位 S3, S2, S1, S0
                
                S3 = mod(current_group(1) + current_group(3) + current_group(5) + current_group(6) + current_group(9), 2);
                S2 = mod(current_group(1) + current_group(2) + current_group(4) + current_group(6) + current_group(7) + current_group(10), 2);
                S1 = mod(current_group(1) + current_group(2) + current_group(3) + current_group(5) + current_group(7) + current_group(8) + current_group(11), 2);
                S0 = mod(current_group(2) + current_group(4) + current_group(5) + current_group(8) + current_group(12), 2);
                
                s = 1000 * S3 + 100 * S2 + 10 * S1 + S0;
                if s~=0
                    switch s
                        case 0001
                            current_group(12) = mod(current_group(12) + 1, 2);  % 翻转错误位1
                        case 0010
                            current_group(11) = mod(current_group(11) + 1, 2);  % 翻转错误位2
                        case 0100
                            current_group(10) = mod(current_group(10) + 1, 2);  % 翻转错误位3
                        case 1000
                            current_group(9) = mod(current_group(9) + 1, 2);  % 翻转错误位4
                        case 0011
                            current_group(8) = mod(current_group(8) + 1, 2);  % 翻转错误位5
                        case 0110
                            current_group(7) = mod(current_group(7) + 1, 2);  % 翻转错误位6
                        case 1100
                            current_group(6) = mod(current_group(6) + 1, 2);  % 翻转错误位7
                        case 1011
                            current_group(5) = mod(current_group(5) + 1, 2);  % 翻转错误位8
                        case 0101
                            current_group(4) = mod(current_group(4) + 1, 2);  % 翻转错误位9
                        case 1010
                            current_group(3) = mod(current_group(3) + 1, 2); % 翻转错误位10
                        case 0111
                            current_group(2) = mod(current_group(2) + 1, 2); % 翻转错误位11
                        case 1110
                            current_group(1) = mod(current_group(1) + 1, 2); % 翻转错误位12
                        otherwise
                            % 默认情况下，无错误检测到，或者处理未知的校验位组合
                            disp('unknown error pattern');
                    end
                end
                output_data((i-1) * k + 1:i * k) = current_group(1:k);  % 返回纠正后的信息位
            else
                error('Invalid (n, k) for Hamming code.');
            end
        end
    elseif code_model == 1  % 循环码译码
        n=7;k=4;
        input_num = length(input_data);  % 获取输入数据的长度
        group_num = floor(input_num / n); % 计算需要分成多少组
        output_data = zeros(1, group_num*k+input_num-n*group_num); % 预分配输出数据
        output_data(group_num*k+1:group_num*k+input_num-n*group_num)=input_data(group_num*n+1:input_num);
    
        % 补零处理，使数据长度可以被n整除
        input_data_aligned = input_data(1:group_num*n);
        % 遍历每一组数据进行译码
        for i = 1:group_num
            % 提取当前组的数据
            current_group = input_data_aligned((i - 1) * n + 1:i * n);
            % 计算伴随式 S(x)
            Sx = calculate_Sx(current_group, Gx);
            % 计算错误图样 E(x)
            Ex = calculate_Ex(Sx, Gx, n);
            % 利用错误图样纠正数据
            corrected_data = mod(current_group + Ex, 2);
    
            % 提取信息位
            output_data((i - 1) * k + 1:i * k) = corrected_data(1:k);
        end
    else
        error('Invalid code_model value. It must be 0 for Hamming code or 1 for Cyclic code.');
    end
end


function Sx = calculate_Sx(Rx, Gx)
    % 计算伴随式 S(x) = R(x) mod g(x)
    [~, remainder] = deconv(Rx, Gx);
    Sx = mod(remainder, 2); % 模 2 取余
end

function Ex = calculate_Ex(Sx, Gx, n)
    % 根据伴随式 S(x) 计算错误图样 E(x)
    
    Ex = zeros(1, n);

    % 遍历可能的错误图样
    for i = 1:n
        % 构造单一错误图样
        error_pattern = zeros(1, n);
        error_pattern(i) = 1;
        % 计算错误图样的伴随式
        error_syndrome = calculate_Sx(error_pattern, Gx);
        % 匹配伴随式
        if isequal(Sx, error_syndrome)
            Ex = error_pattern;
            break;
        end
    end
end

