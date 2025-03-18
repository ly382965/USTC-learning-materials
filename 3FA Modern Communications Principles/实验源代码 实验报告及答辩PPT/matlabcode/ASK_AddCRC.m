%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name:ASK_AddCRC.m
%  Description: 加入CRC校检码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           [output_data] = ASK_AddCRC(input_data, crc_num)
%  Parameter List:
%      Output Parameter:
%           output_data       加入CRC后的输出数据
%      Input Parameter
%           input_data    输入的原始bit数据
%           crc_num       CRC的位数，可选8，12，16，24
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [output_data] = ASK_AddCRC(input_data, crc_num)

input_num = length(input_data);
%% 变量初始化
output_data = zeros(1, input_num+crc_num);
crcBit = zeros(1, crc_num);
regOut = zeros(1, crc_num); 

    %% 功能实现
    switch crc_num
	    case 0
            output_data = input_data;
        case 8
            %生成多项式 gD = D8+D7+D4+D3+D1+1
          %%%%%%%%%%%%%%% student code %%%%%%%%%%%%%%%%%%%%%%%
            % task: 进行CRC的添加
        for num = 1:input_num
                regOut = crcBit;  % shift bits
                crcBit(8) = xor(regOut(7), xor(regOut(8), input_data(num)));
                crcBit(7) = regOut(6);
                crcBit(6) = regOut(5);
                crcBit(5) = xor(regOut(4), xor(regOut(8), input_data(num)));
                crcBit(4) = xor(regOut(3), xor(regOut(8), input_data(num)));
                crcBit(3) = regOut(2);
                crcBit(2) = xor(regOut(1), xor(regOut(8), input_data(num)));
                crcBit(1) = xor(regOut(8), xor(regOut(8), input_data(num)));
            end
            output_data(1, 1:input_num) = input_data(1, 1:input_num);
            output_data(1, input_num + 1:input_num + crc_num) = crcBit;          
        case 12
            %生成多项式 gD = D12+D11+D3+D2+D1+1  
        for num = 1:input_num
            regOut = crcBit;  % shift bits
            crcBit(12) = xor(regOut(11), xor(regOut(12), input_data(num)));
            crcBit(11) = regOut(10);
            crcBit(10) = regOut(9);
            crcBit(9) = regOut(8);
            crcBit(8) = regOut(7);
            crcBit(7) = regOut(6);
            crcBit(6) = regOut(5);
            crcBit(5) = regOut(4);
            crcBit(4) = xor(regOut(3), xor(regOut(12), input_data(num)));
            crcBit(3) = xor(regOut(2), xor(regOut(12), input_data(num)));
            crcBit(2) = xor(regOut(1), xor(regOut(12), input_data(num)));
            crcBit(1) = xor(regOut(12), xor(regOut(12), input_data(num)));
        end
        output_data(1, 1:input_num) = input_data(1, 1:input_num);
        output_data(1, input_num + 1:input_num + crc_num) = crcBit;
                  
        case 16
            %生成多项式 gD = D16+D12+D5+1
        for num = 1:input_num
            regOut = crcBit;  % shift bits
            crcBit(16) = regOut(15);
            crcBit(15) = regOut(14);
            crcBit(14) = regOut(13);
            crcBit(13) = xor(regOut(12), xor(regOut(16), input_data(num)));
            crcBit(12) = regOut(11);
            crcBit(11) = regOut(10);
            crcBit(10) = regOut(9);
            crcBit(9) = regOut(8);
            crcBit(8) = regOut(7);
            crcBit(7) = regOut(6);
            crcBit(6) = xor(regOut(5), xor(regOut(16), input_data(num)));
            crcBit(5) = regOut(4);
            crcBit(4) = regOut(3);
            crcBit(3) = regOut(2);
            crcBit(2) = regOut(1);
            crcBit(1) = xor(regOut(16), input_data(num));
        end
        output_data(1, 1:input_num) = input_data(1, 1:input_num);
        output_data(1, input_num + 1:input_num + crc_num) = crcBit;
    
        case 24
             %生成多项式 gD = D24+D23+D6+D5+D1+1
            for num = 1:input_num
                regOut = crcBit;            %shift bits
                crcBit(24) = xor(regOut(23), xor(regOut(24), input_data(num)));
                crcBit(23) = regOut(22);
                crcBit(22) = regOut(21);
                crcBit(21) = regOut(20);
                crcBit(20) = regOut(19);
                crcBit(19) = regOut(18);
                crcBit(18) = regOut(17);
                crcBit(17) = regOut(16);
                crcBit(16) = regOut(15);	
                crcBit(15) = regOut(14);
                crcBit(14) = regOut(13);
                crcBit(13) = regOut(12);
                crcBit(12) = regOut(11);
                crcBit(11) = regOut(10);
                crcBit(10) = regOut(9);
                crcBit(9)  = regOut(8);
                crcBit(8)  = regOut(7);
                crcBit(7)  = xor(regOut(6), xor(regOut(24), input_data(num)));
                crcBit(6)  = xor(regOut(5), xor(regOut(24), input_data(num)));
                crcBit(5)  = regOut(4);
                crcBit(4)  = regOut(3);
                crcBit(3)  = regOut(2);
                crcBit(2)  = xor(regOut(1), xor(regOut(24), input_data(num)));
                crcBit(1)  = xor(regOut(24), input_data(num)); 
            end 
            output_data(1, 1:input_num) = input_data(1, 1:input_num);
            output_data(1, input_num+1:input_num+crc_num) = crcBit;
        otherwise
            fprintf('error:函数mfTxCRCattach的参数crc_num输入错误\n');
    end    
end


