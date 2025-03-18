function [errnum,ber] = ASK_ber(txbit,rxbit)

errnum = sum(xor(txbit,rxbit));
len = length(txbit);
ber = errnum/len;

end