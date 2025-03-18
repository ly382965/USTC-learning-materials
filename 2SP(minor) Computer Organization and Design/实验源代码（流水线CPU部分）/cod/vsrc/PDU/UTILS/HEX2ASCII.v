module Hex2ASC #(
    parameter               HEX_NUM = 1
) (
    input                   [HEX_NUM*4 - 1  : 0]            number  ,
    output        reg       [HEX_NUM*8 - 1  : 0]            ascii
);

    integer  i;
    always @(*) begin
        for (i = 0; i < HEX_NUM; i = i + 1) begin
            if (number[i*4 +: 4] >= 4'D10)
                ascii[i*8 +: 8] = number[i*4 +: 4] + "A" - 4'D10;
            else
                ascii[i*8 +: 8] = number[i*4 +: 4] + "0";
        end
    end

endmodule