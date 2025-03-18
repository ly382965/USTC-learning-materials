`timescale 10ns/1ns

module FPGA_EXP2_tb();
reg rst2;
reg clk;
reg en;
reg [3:0] input_data;
reg [2:0] reg_choose;
wire [6:0] LED_data;//reg[6]->a,reg[0]->g
wire [7:0] LED_choose;
wire clkout_debug;

FPGA_EXP2 fpga(
    .rst2(rst2),
    .clk(clk),
    .en(en),
    .input_data(input_data),
    .reg_choose(reg_choose),
    .LED_data(LED_data),
    .LED_choose(LED_choose),
    .clkout_debug(clkout_debug)
);

initial begin
    rst2=1;en=0;
    rst2=0;
    #5 rst2=1;
    #5 en=1;
    input_data=4'b0001;
    reg_choose=3'b000;
    #5 en=0;
    #5 en=1;
    input_data=4'b0010;
    reg_choose=3'b001;
    #5 en=0;
    #5 en=1;
    input_data=4'b0011;
    reg_choose=3'b010;
    #5 en=0;
    #5 en=1;
    input_data=4'b0100;
    reg_choose=3'b011;
    #5 en=0;
    #5 en=1;
    input_data=4'b0101;
    reg_choose=3'b100;
    #5 en=0;
    #5 en=1;
    input_data=4'b0110;
    reg_choose=3'b101;
    #5 en=0;
    #5 en=1;
    input_data=4'b0111;
    reg_choose=3'b110;
    #5 en=0;
    #5 en=1;
    input_data=4'b1000;
    reg_choose=3'b111;
    #5
    en=0;
end

initial clk = 1'b0;
always #1 clk = ~clk; //产生时钟信号

endmodule