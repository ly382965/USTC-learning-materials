`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 02:11:42
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

module TOP_tb ();
    reg              [ 0 : 0]            clk;
    reg              [ 0 : 0]            rst;

    reg              [ 0 : 0]            enable;
    reg              [ 4 : 0]            in;
    reg              [ 1 : 0]            ctrl;

    wire             [ 3 : 0]            seg_data;
    wire             [ 2 : 0]            seg_an;
TOP top(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .in(in),
    .ctrl(ctrl),
    .seg_data(seg_data),
    .seg_an(seg_an)
);
initial begin
    clk = 0;
    rst = 1;
    #100
    rst = 0;
    enable=1;ctrl=2'b00;in=5'b00000;
    #10
    enable=0;
    #100
    enable=1;ctrl=2'b01;in=5'b01011;
    #10
    enable=0;
    #100
    enable=1;ctrl=2'b10;in=5'b00011;
    #10
    enable=0;
    #100
    enable=1;ctrl=2'b11;
    #10
    enable=0;
    #100
    enable=1;ctrl=2'b00;in=5'b00010;
    #10
    enable=0;
    #100
    enable=1;ctrl=2'b01;in=5'b01011;
    #10
    enable=0;
    #100
    enable=1;ctrl=2'b10;in=5'b00011;
    #10
    enable=0;
    #100
    enable=1;ctrl=2'b11;
    #10
    enable=0;
    #100

    $finish;
end
always #5 clk = ~clk;
endmodule


module TOP (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,

    input                   [ 0 : 0]            enable,
    input                   [ 4 : 0]            in,
    input                   [ 1 : 0]            ctrl,

    output                  [ 3 : 0]            seg_data,
    output                  [ 2 : 0]            seg_an
);
reg  [4:0]  alu_op;
reg  [31:0] alu_src0;
reg  [31:0] alu_src1;
wire [31:0] alu_res;
reg [31:0] alu_res2;

ALU alu(
    .alu_op(alu_op),
    .alu_src0(alu_src0),
    .alu_src1(alu_src1),
    .alu_res(alu_res)
);

Segment segment(
    .clk(clk),
    .rst(rst),
    .output_data(alu_res2),
    .seg_data(seg_data),
    .seg_an(seg_an)
);
always @(enable or ctrl) begin
    if(enable==1'b1)begin
        case (ctrl)
            2'b00:alu_op=in;
            2'b01:alu_src0={{27{in[4]}}, in[4:0]};
            2'b10:alu_src1={{27{in[4]}}, in[4:0]};
            2'b11:alu_res2=alu_res;
            default: alu_op=in;
        endcase     
    end
end
endmodule

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

module Segment(
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,
    input                   [31 : 0]            output_data,
    output          reg     [ 3 : 0]            seg_data,
    output          reg     [ 2 : 0]            seg_an
);

parameter COUNT_NUM = 50_000_000 / 400;         // 100MHz to 400Hz
parameter SEG_NUM = 8;                          // Number of segments

reg [31:0] counter;
always @(posedge clk) begin
    if (rst)
        counter <= 0;
    else if (counter >= COUNT_NUM)
        counter <= 0;
    else
        counter <= counter + 1;
end

reg [2:0] seg_id;
always @(posedge clk) begin
    if (rst)
        seg_id <= 0;
    else if (counter == COUNT_NUM) begin
        if (seg_id >= SEG_NUM - 1)
            seg_id <= 0;
        else
            seg_id <= seg_id + 1;
    end
end

always @(*) begin
    seg_data = 0;
    case (seg_an)
        'd0     : seg_data = output_data[3:0]; 
        'd1     : seg_data = output_data[7:4];
        'd2     : seg_data = output_data[11:8];
        'd3     : seg_data = output_data[15:12];
        'd4     : seg_data = output_data[19:16];
        'd5     : seg_data = output_data[23:20];
        'd6     : seg_data = output_data[27:24];
        'd7     : seg_data = output_data[31:28];
        default : seg_data = 0;
    endcase
end

always @(*) begin
    seg_an = seg_id;
end
endmodule

