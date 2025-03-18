`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/31 21:00:30
// Design Name: 
// Module Name: 1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module Counter_tb();
reg clk, rst;
wire out;

initial begin
    clk = 0;
    rst = 1;
    #50;
    rst = 0;
end
always #10 clk = ~clk;

Counter #(8) my_counter (
    .clk(clk),
    .rst(rst),
    .out(out)
);
endmodule
