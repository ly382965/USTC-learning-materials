%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_Channelcode.m
%  Description: ��������ѭ����ı���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%           Channel_Bit = ASK_Channelcode(CRC_Bit,code_model,Gx,n,k)
%  Parameter List:
%      Input Parameter:
%           CRC_Bit:  ����CRC֮��ı�������
%           codemodel:ѡ����뷽ʽ 
%           Gx    ѭ��������ɶ���ʽ��[1,0,1,1]��[1,1,0,1]Ϊ��7,4��ѭ������ѡ����ʽ����1λ�������
%           n       �������������鳤�ȣ�n��k��ѡ��12��8�����ߣ�7��4��
%           k       ������������Ϣλ
%      Output Parameter:
%          Channel_Bit      �ŵ����������
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Channel_Bit = ASK_Channelcode(CRC_Bit,code_model,Gx,n,k)
  %%%%%%%%%%%%%%% student code %%%%%%%%%%%%%%%%%%%%%%%      

  % ��ʼ��
  input_num = length(CRC_Bit);
  group_num = floor(input_num / k); % ������Ҫ�ֳɶ�����
  Channel_Bit = zeros(1, group_num*n+input_num-k*group_num); % Ԥ�����������
  Channel_Bit(group_num*n+1:group_num*n+input_num-k*group_num)=CRC_Bit(group_num*k+1:input_num);
  % ȡ������ʹ���ݳ��ȿ��Ա�k����
  CRC_Bit_Aligned = CRC_Bit(1:group_num*k);

  if code_model == 0 % ������ % ʹ�� eye ���ɵ�λ����
      if n == 7 && k == 4
          G = [eye(4), [1 1 1; 1 1 0; 1 0 1; 0 1 1]]; % (7,4) ���ɾ���
      elseif n == 12 && k == 8
          G = [eye(8), [1 1 1 0; 0 1 1 1; 1 0 1 0; 0 1 0 1; 1 0 1 1; 1 1 0 0; 0 1 1 0; 0 0 1 1]];% (12,8) ���ɾ���
      else
          error('Invalid n and k for Hamming code');
      end
      for i = 1:group_num
          block = CRC_Bit_Aligned((i-1)*k+1:i*k); % ȡ����ǰ��
          encoded_block = mod(block * G, 2); % ��������
          Channel_Bit((i-1)*n+1:i*n) = encoded_block; % ������
      end

  elseif code_model == 1 % ѭ����
    n=7;k=4;
    for i = 1:group_num
        % ȡ����ǰ�鲢���� (n-k) ����
        block = CRC_Bit_Aligned((i-1)*k+1:i*k); % ��ǰ���ԭʼ��Ϣλ
        block_out = [block, zeros(1, n-k)]; % �����γ���ʱ����
        
        % deconv���ʵ�ֶ���ʽ�ĳ���
        [~, remainder] = deconv(block_out, Gx);
        Sx = mod(remainder, 2); % ģ 2 ȡ��
        %ƴ����Ϣλ��У��λ
        encoded_block = [block, Sx(k+1:n)];
        %������
        Channel_Bit((i-1)*n+1:i*n) = encoded_block;
    end
  else
      error('Invalid code_model');
  end
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
