%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  File Name: ASK_GenPicture.m
%  Description: 生成图片文件
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Function List :
%          [] = ASK_GenPicture(rewav_bits,M,N,filename,pic_model)
%  Parameter List:
%      Input Parameter:
%           rewav_bits          还原后的数据
%           M                         图片的行数
%           N                          图片的列数
%           picture_model    图像编码方式
%           filename              还原后的图片存放位置
%   History
%       1. Date        : 2022-2-28
%           Author      : LHX
%           Version     : 2.0
%           Modification: 第二版,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = ASK_GenPicture(rewav_bits,M,N,filename,pic_model)

if pic_model == 0
    % 霍夫曼译码
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
    %直接写入图像数据
    bits1 = reshape(rewav_bits,M*N,8);  %重构 M*N列  8行数据
    bits = zeros(M*N,1);
    for i = 1:M*N
        bits(i,1) = ASK_return10(bits1(i,:));  %使得每一行的8个二进制数转换成0-255的数
    end
    bits = bits';
    decode_pic_data = reshape(bits,M,N);    
    %% 图片数据写入图片文件
    decode_pic_data = uint8(decode_pic_data);
    decode_pic_data = reshape(decode_pic_data,128,128,3);
    imwrite(decode_pic_data,filename);
end