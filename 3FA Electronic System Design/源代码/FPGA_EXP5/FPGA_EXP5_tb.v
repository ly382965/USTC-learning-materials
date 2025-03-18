`timescale 1ps/1ps

module FPGA_EXP5_tb();
    
reg clk;
reg rst;
wire [7:0] sign;

FPGA_EXP5 fpga(
    .clk(clk),
    .rst(rst),
    .sign(sign)
);

initial begin
    rst=0;
    #20 rst=1;
end

initial clk=0;
always #20 clk = ~clk; //产生时钟信号

endmodule