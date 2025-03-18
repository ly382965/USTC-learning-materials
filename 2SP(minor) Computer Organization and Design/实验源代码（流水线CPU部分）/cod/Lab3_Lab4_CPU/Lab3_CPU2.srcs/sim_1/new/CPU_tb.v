/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/09 17:02:48
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb();

reg [0:0] clk;
reg [0:0] rst;
reg [0:0] global_en;
wire [31:0] imem_raddr;
wire [31:0] imem_rdata;
reg [0:0] we;
reg [31:0] d;

wire [31 : 0] dmem_rdata; // Unused
wire [ 0 : 0] dmem_we;    // Unused
wire [31 : 0] dmem_raddr;  // Unused
wire [31 : 0] dmem_wdata; // Unused

reg [ 4 : 0]  debug_reg_ra;
wire [31 : 0]  debug_reg_rd;

wire  [ 0 : 0]            commit;
wire  [31 : 0]            commit_pc;
wire  [31 : 0]            commit_inst;
wire  [ 0 : 0]            commit_halt;
wire  [ 0 : 0]            commit_reg_we;
wire  [ 4 : 0]            commit_reg_wa;
wire  [31 : 0]            commit_reg_wd;
wire  [ 0 : 0]            commit_dmem_we;
wire  [31 : 0]            commit_dmem_wa;
wire  [31 : 0]            commit_dmem_wd;

wire  [31:0]     alu_res2;
wire  [4:0]      alu_op2;
wire  [31:0]     alu_src0_2;
wire  [31:0]     alu_src1_2;
wire [1:0]       debug_mux_sel;

wire  [0:0] stall_pc_1;
wire  [1:0] rf_wd_sel_ex_2;
wire [4:0]  rf_wa_ex_2;
wire [4:0]  rf_ra0_id_2;
wire [4:0]  rf_ra1_id_2;

wire [0:0] rf_rd0_fe_2;
wire [0:0] rf_rd1_fe_2;
wire [0:0] rf_we_ex_2;

wire [31:0] rf_rd0_ex_2;
wire [31:0] rf_rd1_ex_2;

wire [3:0]  br_type_ex_2;
wire[1:0]  npc_sel_ex_2;

wire [31:0]    dmem_rd_out_mem_2;
wire [31:0]   dmem_wd_out_mem_2;

INST_MEM mem (
  .a(imem_raddr[10:2]),      // input wire [8 : 0] a
  .d(d),      // input wire [31 : 0] d
  .clk(clk),  // input wire clk
  .we(we),    // input wire we
  .spo(imem_rdata)  // output wire [31 : 0] spo
);

DATA_MEM mem2 (
  .a(dmem_raddr >> 2),      // input wire [8 : 0] a
  .d(dmem_wdata),      // input wire [31 : 0] d
  .clk(clk),  // input wire clk
  .we(dmem_we),    // input wire we
  .spo(dmem_rdata)  // output wire [31 : 0] spo
);

CPU cpu(
    .clk(clk),
    .rst(rst),
    .global_en(global_en),
    .imem_rdata(imem_rdata),
    .imem_raddr(imem_raddr),
    .dmem_addr(dmem_raddr),
    .dmem_rdata(dmem_rdata),
    .dmem_wdata(dmem_wdata),
    .dmem_we(dmem_we),
    .debug_reg_ra(debug_reg_ra),
    .debug_reg_rd(debug_reg_rd),
    .commit(commit),
    .commit_pc(commit_pc),
    .commit_inst(commit_inst),
    .commit_halt(commit_halt),
    .commit_reg_we(commit_reg_we),
    .commit_reg_wa(commit_reg_wa),
    .commit_reg_wd(commit_reg_wd),
    .commit_dmem_wa(commit_dmem_wa),
    .commit_dmem_wd(commit_dmem_wd),
    .commit_dmem_we(commit_dmem_we),
    .alu_res2(alu_res2),
    .alu_op2(alu_op2),
    .alu_src0_2(alu_src0_2),
    .alu_src1_2(alu_src1_2),
    .debug_mux_sel(debug_mux_sel),
    .stall_pc_1(stall_pc_1),
    .rf_wd_sel_ex_2(rf_wd_sel_ex_2),
    .rf_we_ex_2(rf_we_ex_2),
    .rf_wa_ex_2(rf_wa_ex_2),
    .rf_ra0_id_2(rf_ra0_id_2),
    .rf_ra1_id_2(rf_ra1_id_2),
    .rf_rd0_fe_2(rf_rd0_fe_2),
    .rf_rd1_fe_2(rf_rd1_fe_2),
    .rf_rd0_ex_2(rf_rd0_ex_2),
    .rf_rd1_ex_2(rf_rd1_ex_2),
    .br_type_ex_2(br_type_ex_2),
    .npc_sel_ex_2(npc_sel_ex_2),
    .dmem_rd_out_mem_2(dmem_rd_out_mem_2),
    .dmem_wd_out_mem_2(dmem_wd_out_mem_2)
);

initial begin
    clk = 0;
    global_en=1;
    #1
    rst = 1;
    #1
    rst = 0;
    we  = 0;
    d=32'b0;
    #900
    debug_reg_ra=0;
    #1
    repeat(32) begin
        #0.1
        debug_reg_ra=debug_reg_ra+1;
    end
    $finish;
    end

always #1 clk = ~clk;
endmodule
