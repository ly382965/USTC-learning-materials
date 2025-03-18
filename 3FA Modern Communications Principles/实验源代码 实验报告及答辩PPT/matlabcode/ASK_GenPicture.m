%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_GenPicture.m
%  Description: ����ͼƬ�ļ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          [] = ASK_GenPicture(rewav_bits,M,N,filename,pic_model)
%  Parameter List:
%      Input Parameter:
%           rewav_bits          ��ԭ�������
%           M                         ͼƬ������
%           N                          ͼƬ������
%           picture_model    ͼ����뷽ʽ
%           filename              ��ԭ���ͼƬ���λ��
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = ASK_GenPicture(rewav_bits,M,N,filename,pic_model)

if pic_model == 0
    % ����������
    data =load('./dict.mat');
    dict = data.dict;
    deco = huffmandeco(rewav_bits,dict);
    deco = deco';
    if length(deco)<M*N
        deco = [deco; zeros(M*N-length(deco),1)];
    else
        deco = deco(1:M*N);
    end
    decode_pic_data = col2im(deco,[M,N],[M,N],'distinct');
    decode_pic_data = uint8(decode_pic_data);
    imwrite(decode_pic_data,filename);
else
    %ֱ��д��ͼ������
    bits1 = reshape(rewav_bits,M*N,8);  %�ع� M*N��  8������
    bits = zeros(M*N,1);
    for i = 1:M*N
        bits(i,1) = ASK_return10(bits1(i,:));  %ʹ��ÿһ�е�8����������ת����0-255����
    end
    bits = bits';
    decode_pic_data = reshape(bits,M,N);    
    %% ͼƬ����д��ͼƬ�ļ�
    decode_pic_data = uint8(decode_pic_data);
    decode_pic_data = reshape(decode_pic_data,128,128,3);
    imwrite(decode_pic_data,filename);
end