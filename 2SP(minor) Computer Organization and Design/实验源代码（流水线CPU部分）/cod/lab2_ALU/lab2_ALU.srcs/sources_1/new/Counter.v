`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/31 22:23:46
// Design Name: 
// Module Name: Counter
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


module ALU (
    input                   [31 : 0]            alu_src0,
    input                   [31 : 0]            alu_src1,
    input                   [ 4 : 0]            alu_op,

    output      reg         [31 : 0]            alu_res
);
    always @(*) begin
        case(alu_op)
            `ADD :
                alu_res = alu_src0 + alu_src1;
            `SUB :
                alu_res = alu_src0 - alu_src1;
            `SLT :
                alu_res = ($signed(alu_src0) < $signed(alu_src1)) ? 32'b1 : 32'b0;
            `SLTU :
                alu_res = (alu_src0 < alu_src1) ? 32'b1 : 32'b0;
            `AND :
                alu_res = alu_src0 & alu_src1;
            `OR :
                alu_res = alu_src0 | alu_src1;
            `XOR :
                alu_res = alu_src0 ^ alu_src1;
            `SLL :
                alu_res = alu_src0 << alu_src1;
            `SRL :
                alu_res = alu_src0 >> alu_src1;
            `SRA :
                alu_res = alu_src0 >>> alu_src1;
            `SRC0 :
                alu_res = alu_src0;
            `SRC1 :
                alu_res = alu_src1;
            default :
                alu_res = 32'H0;
        endcase
    end
endmodule
