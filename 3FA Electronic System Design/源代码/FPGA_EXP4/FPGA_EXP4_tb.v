`timescale 10ns/1ns

module FPGA_EXP4_tb();
reg         clk;
reg         rst;
reg   [3:0] row_signal;
wire  [3:0] col_signal;
wire  [6:0] LED_data;

FPGA_EXP4 fpga(
    .clk(clk),
    .rst(rst),
    .row_signal(row_signal),
    .col_signal(col_signal),
    .LED_data(LED_data)
);

initial begin
    rst=0; 
    #5 rst=1; 
    #5 row_signal=4'b1110; 
    #40 row_signal=4'b1101;
    #40 row_signal=4'b1011; 
    #40 row_signal=4'b0111;
    #40 row_signal=4'b1101;
end

initial clk=0;
always #5 clk = ~clk; //产生时钟信号

endmodule