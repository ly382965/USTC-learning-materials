`timescale 1ns/1ps
module bram #(
    parameter ADDR_WIDTH = 3,		//地址宽度
    parameter DATA_WIDTH = 128		//数据宽度
)(
    input                   clk,   // Clock
    input [ADDR_WIDTH-1:0]  raddr,  // Address
    input [ADDR_WIDTH-1:0]  waddr,  // Address
    input [DATA_WIDTH-1:0]  din,   // Data Input
    input                   we,    // Write Enable
    output [DATA_WIDTH-1:0] dout   // Data Output
); 
    reg [ADDR_WIDTH-1:0] addr_r;  // Address Register
    reg [DATA_WIDTH-1:0] ram [0:(1 << ADDR_WIDTH)-1];
    integer i;
    initial begin
        for (i = 0; i < (1 << ADDR_WIDTH); i = i + 1) begin
            ram[i] = 0;
        end
    end
    always @(posedge clk) begin
        addr_r <= raddr;
        if(we) ram[waddr] <= din;
    end
    assign dout = ram[addr_r]; 

endmodule