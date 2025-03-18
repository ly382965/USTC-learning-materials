%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: mian.m
%  Description:   ASK����ͨ��ϵͳ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��CRC���ŵ����루�����롢ѭ���룩��
%����ͬ���롢������͡���Ƶ���䣨���ز����ƣ���
%��Ƶ���գ�������ɽ������ƥ���˲���ͬ���������о���
%�ŵ����롢CRCУ�顣Դ֧��ͼƬ����������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%���˵�ͨ�˲�,��ʵϵͳ�����ź�
clc
clear

%% ����
UpSampleRate = 10;  % һ����Ԫ������������
model =2;           % 1������������  2����ͼƬ����  
code_model = 1;      % 0��������  1����ѭ����
Gx=[1,1,0,1];       % ѭ��������ɶ���ʽ��[1,0,1,1]��[1,1,0,1]Ϊ��7,4��ѭ������ѡ����ʽ����1λ�������
n=7;k=4;           % ��ѭ��ʽ 2^k-1>= r+k  nΪ����������ĳ��ȣ�kΪ��Ϣλ���ȣ� n��k��ѡ��12��8�����ߣ�7��4��
SNR = 40;           % ����� -20~40
rf_switch =0;      % 0��ʾ���棬1��ʾӲ��
pic_model = 0;      % ͼƬ���뷽ʽ��0���������룬1�ޱ���
pcip = '192.168.1.180';
xsrpip = '192.168.1.166';
crc_num = 24 ;       % CRCλ����ѡ8��12��16��24
Preamble = [1 1 1 1 0 1 0 1 1 0 0 1 0 0 0 1 1 1 0 1 1];  %ͬ����
PreambleLen = length(Preamble);       %ͬ���볤��
%% ��Դ
voice_read_filename = 'hongdou.wav';
voice_write_filename = 're_hongdou.wav';
pi_read_filename = 'tuzi.jpg';
pi_write_filename = 're_tuzi.jpg';

if model == 1  %����
    read_filename = voice_read_filename;
    write_filename = voice_write_filename;
elseif model == 2 % ͼ��
    read_filename = pi_read_filename;
    write_filename = pi_write_filename;
end

%% ��Դ����
if model ==1 %������������
    [Origin_Bit,Fs] = ASK_PCM(read_filename);
elseif model ==2
    [Origin_Bit,M,N] = ASK_Picturecode(read_filename,pic_model);
end

%% ���ݷ�֡
[FreData,paddingBits,bitLen] = ASK_BitAllocation(code_model,Origin_Bit,n,UpSampleRate);


%% ��֡����
for i =1 :size(FreData)
    %%  ��CRC
    [CRC_Bit] = ASK_AddCRC(FreData(i,:),crc_num);

    %% �ŵ�����
    Channel_Bit = ASK_Channelcode(CRC_Bit,code_model,Gx,n,k);

    %% ����ͬ����
    data = ASK_AddSync(Preamble,Channel_Bit);

    %% �ϲ���
    UpSampledata = ASK_UpSample(data,UpSampleRate);  



    %% ASK����
    tx_data = ASK_Modulation(UpSampledata);

    %% �ŵ�
    if rf_switch == 1
        [rx_data,ERR_CODE] = XSRP_RFLoopback(tx_data,pcip,xsrpip);

    else
        rx_data = ASK_Channel(tx_data,SNR);
    end
    figure(1)
    plot(real(rx_data))
    % ������λ  

%  T = 15000;
%     rx_data= [rx_data(1,T+1:30720),rx_data(1,1:T)];

    %%  �������
    re_data =ASK_DeModulation(rx_data);

    %% ֡ͬ��29170
    [data] = ASK_Sync( re_data,UpSampleRate,bitLen,n,crc_num,code_model,Preamble,PreambleLen);

    %% �����о�
    [judge_data] = ASK_judgement(data,UpSampleRate);

    %% ȥͬ����
    [data1] = ASK_DeSync(judge_data,PreambleLen);

    %% �ŵ�����
%     sum(xor(data1,Channel_Bit))
    [decode_data] = ASK_DeChannelcode(data1,code_model,Gx,n,k);

    %% CRC����
    [CRC_flag,rx_bit] = ASK_DeCRC(decode_data, crc_num);
      % CRC_flag  %CRCУ������1��ʾ������ȷ��0��ʾ�������
    %% ��ӡ����
    if length(FreData(i,:)) == length(rx_bit)
        fprintf('��%d֡CRC��%d    ',i,CRC_flag);
        [errnum,ber] = ASK_ber(FreData(i,:),rx_bit);
        fprintf('��%d֡��������%d    ',i,errnum);
        fprintf('��%d֡�����ʣ�%d\n',i,ber);
        %% ������֡
        rx_FreData(i,:) = rx_bit;
    end
    err(1,i) = errnum;
end

%���һά����
[fram_num,bitLen] = size(rx_FreData);
re_bits = reshape(rx_FreData',1,fram_num*bitLen);  %���һά����
rewav_bits = re_bits(1,1:fram_num*bitLen-paddingBits);

%% ��Դ����
if model == 1 %����
    out_File = ASK_GenVioce(rewav_bits,Fs,write_filename);
elseif model == 2 % ͼƬ
    ASK_GenPicture(rewav_bits,M,N,write_filename,pic_model);   
end


%% ��ʾ����
%1.
figure(114)
plot(real(tx_data))


N = length(tx_data);
w = -N/2:1:N/2-1;

A = fftshift(abs(fft(real(tx_data))));
Amax = max(A);
A = A/Amax;
figure(111)
plot(w,A)

%2.
figure(2)
plot(real(rx_data))
 
 %3.
figure(113)
plot(re_data)

err_sum = sum(err(1,:));
fprintf('��������Ϊ��%d',err_sum);