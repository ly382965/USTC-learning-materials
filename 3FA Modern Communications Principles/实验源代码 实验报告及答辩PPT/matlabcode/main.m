%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: mian.m
%  Description:   ASK数字通信系统
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%含CRC、信道编码（汉明码、循环码）、
%插入同步码、脉冲成型、射频发射（含载波调制）、
%射频接收（含非相干解调）、匹配滤波、同步、抽样判决、
%信道译码、CRC校验。源支持图片、语音两种
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%加了低通滤波,真实系统复数信号
clc
clear

%% 参数
UpSampleRate = 10;  % 一个码元周期内样点数
model =2;           % 1代表语音传输  2代表图片传输  
code_model = 1;      % 0代表汉明码  1代表循环码
Gx=[1,1,0,1];       % 循环码的生成多项式，[1,0,1,1]、[1,1,0,1]为（7,4）循环码优选多项式，有1位检错能力
n=7;k=4;           % 遵循公式 2^k-1>= r+k  n为汉明码编码后的长度，k为信息位长度， n与k可选（12，8）或者（7，4）
SNR = 40;           % 信噪比 -20~40
rf_switch =0;      % 0表示仿真，1表示硬件
pic_model = 0;      % 图片编码方式，0哈夫曼编码，1无编码
pcip = '192.168.1.180';
xsrpip = '192.168.1.166';
crc_num = 24 ;       % CRC位数可选8，12，16，24
Preamble = [1 1 1 1 0 1 0 1 1 0 0 1 0 0 0 1 1 1 0 1 1];  %同步码
PreambleLen = length(Preamble);       %同步码长度
%% 信源
voice_read_filename = 'hongdou.wav';
voice_write_filename = 're_hongdou.wav';
pi_read_filename = 'tuzi.jpg';
pi_write_filename = 're_tuzi.jpg';

if model == 1  %语音
    read_filename = voice_read_filename;
    write_filename = voice_write_filename;
elseif model == 2 % 图像
    read_filename = pi_read_filename;
    write_filename = pi_write_filename;
end

%% 信源编码
if model ==1 %进行语音编码
    [Origin_Bit,Fs] = ASK_PCM(read_filename);
elseif model ==2
    [Origin_Bit,M,N] = ASK_Picturecode(read_filename,pic_model);
end

%% 数据分帧
[FreData,paddingBits,bitLen] = ASK_BitAllocation(code_model,Origin_Bit,n,UpSampleRate);


%% 按帧发送
for i =1 :size(FreData)
    %%  加CRC
    [CRC_Bit] = ASK_AddCRC(FreData(i,:),crc_num);

    %% 信道编码
    Channel_Bit = ASK_Channelcode(CRC_Bit,code_model,Gx,n,k);

    %% 加入同步码
    data = ASK_AddSync(Preamble,Channel_Bit);

    %% 上采样
    UpSampledata = ASK_UpSample(data,UpSampleRate);  



    %% ASK调制
    tx_data = ASK_Modulation(UpSampledata);

    %% 信道
    if rf_switch == 1
        [rx_data,ERR_CODE] = XSRP_RFLoopback(tx_data,pcip,xsrpip);

    else
        rx_data = ASK_Channel(tx_data,SNR);
    end
    figure(1)
    plot(real(rx_data))
    % 向右移位  

%  T = 15000;
%     rx_data= [rx_data(1,T+1:30720),rx_data(1,1:T)];

    %%  解调过程
    re_data =ASK_DeModulation(rx_data);

    %% 帧同步29170
    [data] = ASK_Sync( re_data,UpSampleRate,bitLen,n,crc_num,code_model,Preamble,PreambleLen);

    %% 抽样判决
    [judge_data] = ASK_judgement(data,UpSampleRate);

    %% 去同步码
    [data1] = ASK_DeSync(judge_data,PreambleLen);

    %% 信道译码
%     sum(xor(data1,Channel_Bit))
    [decode_data] = ASK_DeChannelcode(data1,code_model,Gx,n,k);

    %% CRC检验
    [CRC_flag,rx_bit] = ASK_DeCRC(decode_data, crc_num);
      % CRC_flag  %CRC校验结果，1表示传输正确，0表示传输错误
    %% 打印数据
    if length(FreData(i,:)) == length(rx_bit)
        fprintf('第%d帧CRC：%d    ',i,CRC_flag);
        [errnum,ber] = ASK_ber(FreData(i,:),rx_bit);
        fprintf('第%d帧误码数：%d    ',i,errnum);
        fprintf('第%d帧误码率：%d\n',i,ber);
        %% 数据组帧
        rx_FreData(i,:) = rx_bit;
    end
    err(1,i) = errnum;
end

%变成一维矩阵
[fram_num,bitLen] = size(rx_FreData);
re_bits = reshape(rx_FreData',1,fram_num*bitLen);  %变成一维矩阵
rewav_bits = re_bits(1,1:fram_num*bitLen-paddingBits);

%% 信源译码
if model == 1 %语音
    out_File = ASK_GenVioce(rewav_bits,Fs,write_filename);
elseif model == 2 % 图片
    ASK_GenPicture(rewav_bits,M,N,write_filename,pic_model);   
end


%% 显示处理
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
fprintf('总误码数为：%d',err_sum);