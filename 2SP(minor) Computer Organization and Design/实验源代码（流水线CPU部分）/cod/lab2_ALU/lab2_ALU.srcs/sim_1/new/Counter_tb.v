`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/31 23:40:15
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



module ALU_tb();
//...
    reg [31 : 0] src0;
    reg [31 : 0] src1;
    reg [4 : 0] sel;
    wire [31 : 0] res;

    ALU alu(
                .alu_src0(src0),
                .alu_src1(src1),
                .alu_op(sel),
                .alu_res(res)
    );

    integer op;
    initial begin
        src0=32'H5; 
        src1=32'H2; 
        sel=5'b0;

        for(op=0;op<5'b11111;op=op+1)
        {
            #20
            sel=sel+5'b1;
        }       

        $finish;
    end
//...
endmodule