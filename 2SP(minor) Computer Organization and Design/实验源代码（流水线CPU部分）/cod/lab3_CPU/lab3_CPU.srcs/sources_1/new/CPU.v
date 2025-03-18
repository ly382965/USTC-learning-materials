`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/09 00:58:22
// Design Name: 
// Module Name: CPU
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

module CPU (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,

    input                   [ 0 : 0]            global_en,

/* ------------------------------ Memory (inst) ----------------------------- */
    output                  [31 : 0]            imem_raddr,
    input                   [31 : 0]            imem_rdata,

/* ------------------------------ Memory (data) ----------------------------- */
    input                   [31 : 0]            dmem_rdata,
    output                  [ 0 : 0]            dmem_we,
    output                  [31 : 0]            dmem_addr,
    output                  [31 : 0]            dmem_wdata,

/* ---------------------------------- Debug --------------------------------- */
    output                  [ 0 : 0]            commit,
    output                  [31 : 0]            commit_pc,
    output                  [31 : 0]            commit_inst,
    output                  [ 0 : 0]            commit_halt,
    output                  [ 0 : 0]            commit_reg_we,
    output                  [ 4 : 0]            commit_reg_wa,
    output                  [31 : 0]            commit_reg_wd,
    output                  [ 0 : 0]            commit_dmem_we,
    output                  [31 : 0]            commit_dmem_wa,
    output                  [31 : 0]            commit_dmem_wd,

    input                   [ 4 : 0]            debug_reg_ra,
    output                  [31 : 0]            debug_reg_rd
);

PC my_pc (
    .clk    (clk        ),
    .rst    (rst        ),
    .en     (global_en  ),    // 当 global_en 为高电平时，PC 才会更新，CPU 才会执行指令。
    .npc    (cur_npc    ),
    .pc     (cur_pc     )
);




endmodule



module DECODER(
    input                   [31 : 0]            inst,

    output  reg             [ 4 : 0]            alu_op,
    output  reg             [31 : 0]            imm,

    output                  [ 4 : 0]            rf_ra0,
    output                  [ 4 : 0]            rf_ra1,
    output                  [ 4 : 0]            rf_wa,
    output  reg             [ 0 : 0]            rf_we,

    output  reg             [ 0 : 0]            alu_src0_sel,
    output  reg             [ 0 : 0]            alu_src1_sel
);

wire [6:0] opcode;
wire [6:0] funct7;
wire [2:0] funct3;
wire [9:0] funct;

assign opcode=inst[6:0];
assign funct3=inst[14:12];
assign funct7=inst[31:25];
assign funct={funct3[2:0],funct7[6:0]};

//register
assign rf_wa=inst[11:7];
assign rf_ra0=inst[19:15];
assign rf_ra1=inst[24:20];

//imm
always @(*) begin
    case (opcode)
        7'b0010011: imm={{20{inst[31]}},inst[31:20]};//I type
        7'b0110111: imm={inst[31:12],12'b0};//U type lui
        7'b0010111: imm={inst[31:12],12'b0};//U type auipc
        default: imm=32'b0;
    endcase
end

always @(*) begin
    if (opcode==7'b0110011) begin
        case (funct)
            10'b000_0000000: alu_op=5'B00000;//add
            10'b000_0100000: alu_op=5'B00010;//sub
            10'b001_0000000: alu_op=5'B01110;//sll
            10'b010_0000000: alu_op=5'B00100;//slt
            10'b011_0000000: alu_op=5'B00101;//sltu
            10'b100_0000000: alu_op=5'B01011;//xor
            10'b101_0000000: alu_op=5'B01111;//srl
            10'b101_0100000: alu_op=5'B10000;//sra
            10'b110_0000000: alu_op=5'B01010;//or
            10'b111_0000000: alu_op=5'B01001;//and
            default:alu_op=5'b11111; 
        endcase
    end
    else if (opcode==7'b0010011) begin
        case (funct3)
            3'b000:alu_op=5'B00000;//addi
            3'b001:alu_op=5'B01110;//slli
            3'b010:alu_op=5'B00100;//slti
            3'b011:alu_op=5'B00101;//sltiu
            3'b100:alu_op=5'B01011;//xori
            3'b101:if(funct7==7'b0000000)begin
                alu_op=5'B01111;//srli
            end
            else begin
                alu_op=5'B10000;//srai
            end
            3'b110:alu_op=5'B01010;//ori
            3'b111:alu_op=5'B01001;//andi
            default: alu_op=5'b11111;
        endcase
    end
    else begin
        alu_op=5'B00000;//else to add
    end
end
//alu_src0_sel=0,来自ra0,alu_src0_sel=1,来自PC。alu_src1_sel=0,来自ra1,alu_src0_sel=1,来自imm
always @(*) begin
    case (opcode)
        7'b0110011: alu_src0_sel=0; //R-type
        7'b0010011: alu_src0_sel=0; //I-type
        7'b0010111: alu_src0_sel=1; //auipc
        7'b0110111: alu_src0_sel=0; //lui
        default: alu_src0_sel=0;
    endcase
end

always @(*) begin
    case (opcode)
        7'b0110011: alu_src1_sel=0;//R-type
        7'b0010011: alu_src1_sel=1;//I-type
        7'b0010111: alu_src1_sel=1;//auipc
        7'b0110111: alu_src1_sel=1;//lui
        default: alu_src1_sel=0;
    endcase
end

//rf_we
always @(*) begin
    case (opcode)
        7'b0110011: rf_we=1;//R-type
        7'b0010011: rf_we=1;//I-type
        7'b0010111: rf_we=1;//auipc
        7'b0110111: rf_we=1;//lui
        default: rf_we=1;
    endcase
end

endmodule

module PC (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,
    input                   [ 0 : 0]            en,
    input                   [31 : 0]            npc,

    output      reg         [31 : 0]            pc
);


always @(posedge clk) begin
    if(en==1)begin
        if (rst)
            pc <= 32'h00400000; 
        else
            pc <= npc;     
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
                alu_res = $signed(alu_src0) >>> $signed(alu_src1);
            `SRC0 :
                alu_res = alu_src0;
            `SRC1 :
                alu_res = alu_src1;
            default :
                alu_res = 32'H0;
        endcase
    end
endmodule

module REG_FILE (
    input                   [ 0 : 0]        clk,

    input                   [ 4 : 0]        rf_ra0,
    input                   [ 4 : 0]        rf_ra1,   
    input                   [ 4 : 0]        rf_wa,
    input                   [ 0 : 0]        rf_we,
    input                   [31 : 0]        rf_wd,

    output                  [31 : 0]        rf_rd0,
    output                  [31 : 0]        rf_rd1,

    input                   [ 4 : 0]        debug_reg_ra,
    output                  [31 : 0]        debug_reg_rd
);

    reg [31 : 0] reg_file [0 : 31];

    // 用于初始化寄存器
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
            reg_file[i] = 0;
    end

    assign rf_rd0=reg_file[rf_ra0];
    assign rf_rd1=reg_file[rf_ra1];
    assign debug_reg_rd=reg_file[debug_reg_ra];

    always @(posedge clk) begin
        if (rf_we) begin
            reg_file[rf_wa] <= rf_wd;
        end
        reg_file[5'b0]<=32'b0;
    end

endmodule

module MUX1 # (
    parameter               WIDTH                   = 32
)(
    input                   [WIDTH-1 : 0]           src0, src1,
    input                   [      0 : 0]           sel,

    output                  [WIDTH-1 : 0]           res
);

    assign res = sel ? src1 : src0;

endmodule


