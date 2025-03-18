function outdata = ASK_return10(inputdata)

len = length(inputdata);
l = ceil(len/8);
for i = 1:l
    a = inputdata(1,(i-1)*8+1:i*8);
    
    outdata(i) = a(1)*2^7+a(2)*2^6+a(3)*2^5+a(4)*2^4+a(5)*2^3+a(6)*4+a(7)*2+a(8);
end


