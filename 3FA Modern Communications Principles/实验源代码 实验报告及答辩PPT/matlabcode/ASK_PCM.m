%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name:ASK_PCM.m
%  Description: 对语音文件做PCM 量化编码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%         [Origin_Bit,Fs] = ASK_PCM(voice_path)
%  Parameter List:
%     Input Parameter
%         voice_path: 声音源文件的输入位置
%     Output Parameter:
%         Origin_Bit:   数据比特
%         Fs:                声音的采样频率
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [Origin_Bit,Fs] = ASK_PCM(voice_path)

%      [read_audio,Fs,bits] = wavread(voice_path);  %读取采样率而和声音数据
       [read_audio,Fs] = audioread(voice_path);  %读取采样率和声音数据
     read_audio = read_audio';        %将一列数据转换成行
     read_audio = read_audio(1,:);  %取其中一行即可 
     
     
     
     read_audio_num = length(read_audio);  
     r_num = floor(read_audio_num/Fs);   %即此音频有多少秒
     r_num = 2;                     %取此音频的前r_num秒
     Origin_Bit = zeros(1,length(r_num*Fs*8)); 
     
     for sec = 1:r_num    % 对每一秒进行处理
        y = read_audio(1,(sec-1)*Fs+1:sec*Fs);
%%  归一化
        x = y/max(abs(y));  %归一化处理
        
%% 编码过程
        n=length(x);
        pcm_data=zeros(1,n*8);%得到8位pcm编码
        b=zeros(1,n);

        x1=x;      % 对归一化后数据进行 非均匀量化编码
        for m=1:n
            Is=x1(1,m);% 归一化后 输入数据第m样点值
            if Is>1||Is<-1
                error('归一化错误')                    %('input must within [-1,1]')
            end

            Is=round(Is*2048); % Is 为 输入数据第m样点，放大128，按照非均匀量化规则量化编码
            C=zeros(1,8);  %将8位PCM编码初始化为全0
            if Is>0
                C(1)=1 ;  %判断抽样值的正负
            end

            % the polarity determins C(1)

            abIs=abs(Is); %取绝对值 ， 极性由第一位编码确定，数值大小 由后七位编码确定

            if   0<abIs && abIs<=16 %16级量化编码 按照段内起始电平 段内量化间隔对数据进行编码  函数自编。
                C(2:4)=[0 0 0];    %8级量化编码
                q=1;   %  段内量化间隔
                a=0;   %  段内起始电平
                C(5:8)=e_coding(abIs,q,a); %16级量化编码
            end
             if  16<abIs && abIs<=32
                C(2:4)=[0 0 1];
                q=1;
                a=16;
                C(5:8)=e_coding(abIs,q,a);
            end
            if 32<abIs && abIs<=64
                C(2:4)=[0 1 0];
                q=2;
                a=32;
                C(5:8)=e_coding(abIs,q,a);
            end
            if 64<abIs && abIs<=128
                C(2:4)=[0 1 1];
                q=4;
                a=64;
                C(5:8)=e_coding(abIs,q,a);
            end
            if 128<abIs && abIs<=256
                C(2:4)=[1 0 0];
                q=8;
                a=128;
                C(5:8)=e_coding(abIs,q,a);
            end
            if 256<abIs && abIs<=512
                C(2:4)=[1 0 1];
                q=16;
                a=256;
                C(5:8)=e_coding(abIs,q,a);
            end
            if 512<abIs && abIs<=1024
                C(2:4)=[1 1 0];
                q=32;
                a=512;
                C(5:8)=e_coding(abIs,q,a);
            end
            if 1024<abIs && abIs<=2048
                C(2:4)=[1 1 1];
                q=64;
                a=1024;
                C(5:8)=e_coding(abIs,q,a);
            end
              pcm_data(1,(m-1)*8+1:m*8)=C;  %得到8位pcm编码
        end
         
         %% 得到bit数据
         Origin_Bit(1,(sec-1)*Fs*8+1:1:sec*Fs*8) = pcm_data;
     end