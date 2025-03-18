%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name:   ASK_Picturecode.m
%  Description: 图像编码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          [Origin_Bit,M,N] = ASK_Picturecode(pi_path,picture_model)
%  Parameter List:
%     Output Parameter:
%           Origin_Bit           编码后数据
%           M                         图片的行数
%           N                          图片的列数
%     Input Parameter
%           pi_path                图片文件的路径
%           picture_model    图像编码方式
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Origin_Bit,M,N] = ASK_Picturecode(pi_path,picture_model)
m1 = imread(pi_path);

if picture_model == 0   % 哈夫曼编码
    m1 = rgb2gray(m1); % 哈夫曼编码时，传输灰度图像
    [M,N] = size(m1);
    I1 = m1(:);
    p = zeros(1,256);
    % 获取各符号的概率
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
   bitlen = M*N;                 %M*N 就是总数据长度 里面的值是0-255
   picture_code = reshape(m1,1,bitlen);      %重构一维矩阵
   picture_code = dec2bin(picture_code);      %格式转化
   picture_code = boolean(picture_code -'0');
   picture_code  = double(picture_code);
   Origin_Bit = reshape(picture_code,1,bitlen*8);
end