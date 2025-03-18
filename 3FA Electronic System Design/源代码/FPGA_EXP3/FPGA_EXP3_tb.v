`timescale 10ns/1ns

module FPGA_EXP3_tb();

reg clk;
reg rst;
reg sel;
wire signal;
wire[3:0] debug_st;

FPGA_EXP3 fpga(
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .signal(signal),
    .debug_st(debug_st)
);

initial begin
   rst=0;
   #5 rst=1;
   #5 sel=1;
   #1000 sel=0;
   #1000 sel=1;
   #1000 sel=0;
   #1000 sel=1;
end

initial clk = 1'b0;
always #5 clk = ~clk; //产生时钟信号

endmodule