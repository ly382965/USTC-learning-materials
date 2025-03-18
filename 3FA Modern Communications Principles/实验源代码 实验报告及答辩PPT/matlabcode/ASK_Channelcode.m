%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_Channelcode.m
%  Description: 汉明码与循环码的编码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           Channel_Bit = ASK_Channelcode(CRC_Bit,code_model,Gx,n,k)
%  Parameter List:
%      Input Parameter:
%           CRC_Bit:  加入CRC之后的比特数据
%           codemodel:选择编码方式 
%           Gx    循环码的生成多项式，[1,0,1,1]、[1,1,0,1]为（7,4）循环码优选多项式，有1位检错能力
%           n       汉明码编码的码组长度，n与k可选（12，8）或者（7，4）
%           k       汉明码编码的信息位
%      Output Parameter:
%          Channel_Bit      信道编码后数据
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Channel_Bit = ASK_Channelcode(CRC_Bit,code_model,Gx,n,k)
  %%%%%%%%%%%%%%% student code %%%%%%%%%%%%%%%%%%%%%%%      

  % 初始化
  input_num = length(CRC_Bit);
  group_num = floor(input_num / k); % 计算需要分成多少组
  Channel_Bit = zeros(1, group_num*n+input_num-k*group_num); % 预分配输出数据
  Channel_Bit(group_num*n+1:group_num*n+input_num-k*group_num)=CRC_Bit(group_num*k+1:input_num);
  % 取整处理，使数据长度可以被k整除
  CRC_Bit_Aligned = CRC_Bit(1:group_num*k);

  if code_model == 0 % 汉明码 % 使用 eye 生成单位矩阵
      if n == 7 && k == 4
          G = [eye(4), [1 1 1; 1 1 0; 1 0 1; 0 1 1]]; % (7,4) 生成矩阵
      elseif n == 12 && k == 8
          G = [eye(8), [1 1 1 0; 0 1 1 1; 1 0 1 0; 0 1 0 1; 1 0 1 1; 1 1 0 0; 0 1 1 0; 0 0 1 1]];% (12,8) 生成矩阵
      else
          error('Invalid n and k for Hamming code');
      end
      for i = 1:group_num
          block = CRC_Bit_Aligned((i-1)*k+1:i*k); % 取出当前组
          encoded_block = mod(block * G, 2); % 汉明编码
          Channel_Bit((i-1)*n+1:i*n) = encoded_block; % 存入结果
      end

  elseif code_model == 1 % 循环码
    n=7;k=4;
    for i = 1:group_num
        % 取出当前组并附加 (n-k) 个零
        block = CRC_Bit_Aligned((i-1)*k+1:i*k); % 当前组的原始信息位
        block_out = [block, zeros(1, n-k)]; % 补零形成临时编码
        
        % deconv解卷，实现多项式的除法
        [~, remainder] = deconv(block_out, Gx);
        Sx = mod(remainder, 2); % 模 2 取余
        %拼接信息位和校验位
        encoded_block = [block, Sx(k+1:n)];
        %存入结果
        Channel_Bit((i-1)*n+1:i*n) = encoded_block;
    end
  else
      error('Invalid code_model');
  end
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
