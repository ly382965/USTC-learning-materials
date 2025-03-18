`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/09 15:57:32
// Design Name: 
// Module Name: DECODER_tb
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

`define ADD                 5'B00000    
`define SUB                 5'B00010   
`define SLT                 5'B00100
`define SLTU                5'B00101
`define AND                 5'B01001
`define OR                  5'B01010
`define XOR                 5'B01011
`define SLL                 5'B01110   
`define SRL                 5'B01111    
`define SRA                 5'B10000  
`define SRC0                5'B10001
`define SRC1                5'B10010

module DECODER_tb();
    reg [31:0]  inst;
    wire [4:0] alu_op;
    wire [31:0] imm;
    wire [4:0] rf_ra0;
    wire [4:0] rf_ra1;
    wire [4:0] rf_wa;
    wire [0:0] rf_we;
    wire [0:0] alu_src0_sel;
    wire [0:0] alu_src1_sel;
    reg  clk;

DECODER decoder_tb(
    .inst(inst),
    .alu_op(alu_op),
    .imm(imm),
    .rf_ra0(rf_ra0),
    .rf_ra1(rf_ra1),
    .rf_wa(rf_wa),
    .rf_we(rf_we),
    .alu_src0_sel(alu_src0_sel),
    .alu_src1_sel(alu_src1_sel)
);
//rs2段为5，rs1段为15，rd段为16,imm段为28（1 1100）
initial begin
    clk = 0;
    
    #5
    inst=32'b0000000_00101_01111_000_10000_0110011;//add
    #5
    inst=32'b0100000_00101_01111_000_10000_0110011;//sub
    #5
    inst=32'b0000000_00101_01111_001_10000_0110011;//sll
    #5
    inst=32'b0000000_00101_01111_010_10000_0110011;//slt
    #5
    inst=32'b0000000_00101_01111_011_10000_0110011;//sltu
    #5
    inst=32'b0000000_00101_01111_100_10000_0110011;//xor
    #5
    inst=32'b0000000_00101_01111_101_10000_0110011;//srl
    #5
    inst=32'b0100000_00101_01111_101_10000_0110011;//sra
    #5
    inst=32'b0000000_00101_01111_110_10000_0110011;//or
    #5
    inst=32'b0000000_00101_01111_111_10000_0110011;//and
    #10
    inst=32'b0000000_00000_00011_100_10000_0110111;//lui
    #10
    inst=32'b0000000_11100_01111_000_10000_0010011;//addi
    #5
    inst=32'b0000000_11100_01111_001_10000_0010011;//slli
    #5
    inst=32'b0000000_11100_01111_010_10000_0010011;//slti
    #5
    inst=32'b0000000_11100_01111_011_10000_0010011;//sltiu
    #5
    inst=32'b0000000_11100_01111_100_10000_0010011;//xori
    #5
    inst=32'b0000000_11100_01111_101_10000_0010011;//srli
    #5
    inst=32'b0100000_11100_01111_101_10000_0010011;//srai
    #5
    inst=32'b0000000_11100_01111_110_10000_0010011;//ori
    #5
    inst=32'b0000000_11100_01111_111_10000_0010011;//andi
    #10
    inst=32'b0000000_00000_00011_100_10000_0010111;//auipc
    #10

    $finish;
end
always #5 clk = ~clk;

endmodule
