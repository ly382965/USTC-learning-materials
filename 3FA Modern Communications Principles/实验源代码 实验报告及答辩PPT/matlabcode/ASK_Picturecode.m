%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name:   ASK_Picturecode.m
%  Description: ͼ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          [Origin_Bit,M,N] = ASK_Picturecode(pi_path,picture_model)
%  Parameter List:
%     Output Parameter:
%           Origin_Bit           ���������
%           M                         ͼƬ������
%           N                          ͼƬ������
%     Input Parameter
%           pi_path                ͼƬ�ļ���·��
%           picture_model    ͼ����뷽ʽ
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: �ڶ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Origin_Bit,M,N] = ASK_Picturecode(pi_path,picture_model)
m1 = imread(pi_path);

if picture_model == 0   % ����������
    m1 = rgb2gray(m1); % ����������ʱ������Ҷ�ͼ��
    [M,N] = size(m1);
    I1 = m1(:);
    p = zeros(1,256);
    % ��ȡ�����ŵĸ���
    for i = 0:255
        p(i+1) = length(find(I1 == i))/(M*N);
    end
    k = 0:255;
    dict = huffmandict(k,p);
    enco = huffmanenco(I1,dict);
    Origin_Bit = enco';
    save('./dict.mat','dict');
else
   [M,N] = size(m1);
   bitlen = M*N;                 %M*N ���������ݳ��� �����ֵ��0-255
   picture_code = reshape(m1,1,bitlen);      %�ع�һά����
   picture_code = dec2bin(picture_code);      %��ʽת��
   picture_code = boolean(picture_code -'0');
   picture_code  = double(picture_code);
   Origin_Bit = reshape(picture_code,1,bitlen*8);
end