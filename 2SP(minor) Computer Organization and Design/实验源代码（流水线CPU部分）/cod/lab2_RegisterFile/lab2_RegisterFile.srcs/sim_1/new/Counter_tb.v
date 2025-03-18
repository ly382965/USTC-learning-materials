`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/31 21:50:06
// Design Name: 
// Module Name: Counter_tb
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


module RegFile_tb ();
reg                 clk;
reg     [ 4 : 0]    ra0, ra1, wa;
reg     [ 0 : 0]    we;
reg     [31 : 0]    wd;
wire    [31 : 0]    rd0;
wire    [31 : 0]    rd1;

REG_FILE regfile (
    .clk    (clk),
    .rf_ra0    (ra0),
    .rf_ra1    (ra1),
    .rf_wa     (wa),
    .rf_we     (we),
    .rf_wd     (wd),
    .rf_rd0    (rd0),
    .rf_rd1    (rd1)
);

initial begin
    clk = 0;
    ra0 = 5'H0; ra1 = 5'H0; wa = 5'H0; we = 1'H0; wd = 32'H0;

    #12
    ra0 = 5'H0; ra1 = 5'H0; wa = 5'H3; we = 1'H1; wd = 32'H12345678;

    #5
    ra0 = 5'H0; ra1 = 5'H0; wa = 5'H0; we = 1'H0; wd = 32'H0;

    #5
    ra0 = 5'H3; ra1 = 5'H2; wa = 5'H2; we = 1'H1; wd = 32'H87654321;

    #5
    ra0 = 5'H0; ra1 = 5'H0; wa = 5'H0; we = 1'H0; wd = 32'H0;

    #5
    ra0 = 5'H3; ra1 = 5'H0; wa = 5'H0; we = 1'H1; wd = 32'H87654321;

    #10
    $finish;
end
always #5 clk = ~clk;
endmodule
