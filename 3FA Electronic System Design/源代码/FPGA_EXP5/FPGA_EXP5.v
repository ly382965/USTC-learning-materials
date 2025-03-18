`timescale 1ps/1ps

module FPGA_EXP5 (
    input clk,
    input rst,
    output [7:0] sign
);

reg [9:0] addr;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        addr<=10'b0;
    end
    else begin
        if(addr<10'b1111111111) begin
            addr<=addr+10'b1;
        end
        else begin
            addr<=10'b0;
        end
    end
end

mystorage rom(
    .clock(clk),
    .address(addr),
    .q(sign)
);

endmodule