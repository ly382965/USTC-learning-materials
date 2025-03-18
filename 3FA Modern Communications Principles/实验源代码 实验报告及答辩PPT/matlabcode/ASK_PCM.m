%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name:ASK_PCM.m
%  Description: �������ļ���PCM ��������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%         [Origin_Bit,Fs] = ASK_PCM(voice_path)
%  Parameter List:
%     Input Parameter
%         voice_path: ����Դ�ļ�������λ��
%     Output Parameter:
%         Origin_Bit:   ���ݱ���
%         Fs:                �����Ĳ���Ƶ��
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [Origin_Bit,Fs] = ASK_PCM(voice_path)

%      [read_audio,Fs,bits] = wavread(voice_path);  %��ȡ�����ʶ�����������
       [read_audio,Fs] = audioread(voice_path);  %��ȡ�����ʺ���������
     read_audio = read_audio';        %��һ������ת������
     read_audio = read_audio(1,:);  %ȡ����һ�м��� 
     
     
     
     read_audio_num = length(read_audio);  
     r_num = floor(read_audio_num/Fs);   %������Ƶ�ж�����
     r_num = 2;                     %ȡ����Ƶ��ǰr_num��
     Origin_Bit = zeros(1,length(r_num*Fs*8)); 
     
     for sec = 1:r_num    % ��ÿһ����д���
        y = read_audio(1,(sec-1)*Fs+1:sec*Fs);
%%  ��һ��
        x = y/max(abs(y));  %��һ������
        
%% �������
        n=length(x);
        pcm_data=zeros(1,n*8);%�õ�8λpcm����
        b=zeros(1,n);

        x1=x;      % �Թ�һ�������ݽ��� �Ǿ�����������
        for m=1:n
            Is=x1(1,m);% ��һ���� �������ݵ�m����ֵ
            if Is>1||Is<-1
                error('��һ������')                    %('input must within [-1,1]')
            end

            Is=round(Is*2048); % Is Ϊ �������ݵ�m���㣬�Ŵ�128�����շǾ�������������������
            C=zeros(1,8);  %��8λPCM�����ʼ��Ϊȫ0
            if Is>0
                C(1)=1 ;  %�жϳ���ֵ������
            end

            % the polarity determins C(1)

            abIs=abs(Is); %ȡ����ֵ �� �����ɵ�һλ����ȷ������ֵ��С �ɺ���λ����ȷ��

            if   0<abIs && abIs<=16 %16���������� ���ն�����ʼ��ƽ ����������������ݽ��б���  �����Աࡣ
                C(2:4)=[0 0 0];    %8����������
                q=1;   %  �����������
                a=0;   %  ������ʼ��ƽ
                C(5:8)=e_coding(abIs,q,a); %16����������
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
              pcm_data(1,(m-1)*8+1:m*8)=C;  %�õ�8λpcm����
        end
         
         %% �õ�bit����
         Origin_Bit(1,(sec-1)*Fs*8+1:1:sec*Fs*8) = pcm_data;
     end