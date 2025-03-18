`timescale 10ns/1ns

module FPGA_EXP2(
	input rst2,
	input clk,
	input en,
	input [3:0] input_data,
	input [2:0] reg_choose,
	output DP,
	output [6:0] LED_data,//reg[6]->a,reg[0]->g
	output reg[7:0] LED_choose,
	output clkout_debug
);

reg [3:0] data_S0;
reg [3:0] data_S1;
reg [3:0] data_S2;
reg [3:0] data_S3;
reg [3:0] data_S4;
reg [3:0] data_S5;
reg [3:0] data_S6;
reg [3:0] data_S7;

reg [3:0] output_data;

wire rst;
assign rst=~rst2;
assign DP=1'b0;
wire clkout;
reg [2:0] num;

div50MHZ div1(
	.clk(clk),
	.clkout(clkout),
	.rst(rst)
);

assign clkout_debug=clkout;
always @(posedge en) begin
	
	if(rst)
		begin
			data_S0<=4'b0001;
			data_S1<=4'b0010;
			data_S2<=4'b0011;
			data_S3<=4'b0100;
			data_S4<=4'b0101;
			data_S5<=4'b0110;
			data_S6<=4'b0111;
			data_S7<=4'b1000;
		end
	
	if(en)
		begin
			case (reg_choose)
				3'b000: data_S0<=input_data;
				3'b001: data_S1<=input_data;
				3'b010: data_S2<=input_data;
				3'b011: data_S3<=input_data;
				3'b100: data_S4<=input_data;
				3'b101: data_S5<=input_data;
				3'b110: data_S6<=input_data;
				3'b111: data_S7<=input_data;
			endcase
		end
	end

	always @(posedge clkout) 
	begin
		if(num == 3'b111)
			begin
				num <= 3'b000;
			end
		else if(num>=3'b000 && num<=3'b110)
			begin
				num <= num + 3'b001;
			end
		else
			begin
				num <=3'b000;
			end
			
		case (num)
		3'b000: begin output_data<=data_S0; LED_choose<=8'b00000001; end
		3'b001: begin output_data<=data_S1; LED_choose<=8'b00000010; end
		3'b010: begin output_data<=data_S2; LED_choose<=8'b00000100; end
		3'b011: begin output_data<=data_S3; LED_choose<=8'b00001000; end 
		3'b100: begin output_data<=data_S4; LED_choose<=8'b00010000; end
		3'b101: begin output_data<=data_S5; LED_choose<=8'b00100000; end
		3'b110: begin output_data<=data_S6; LED_choose<=8'b01000000; end
		3'b111: begin output_data<=data_S7; LED_choose<=8'b10000000; end
		endcase
	end

LED_decoder decoder1(
	.in(output_data),
	.out(LED_data)
);

endmodule

module LED_decoder(
	input [3:0] in,
	output reg [6:0] out
);
	always @(*) begin
		case (in)
			4'b0000: out = 7'b0000001;
			4'b0001: out = 7'b1001111;
			4'b0010: out = 7'b0010010;
			4'b0011: out = 7'b0000110;
			4'b0100: out = 7'b1001100;
			4'b0101: out = 7'b0100100;
			4'b0110: out = 7'b0100000;
			4'b0111: out = 7'b0001111;
			4'b1000: out = 7'b0000000;
			4'b1001: out = 7'b0000100;
			4'b1010: out = 7'b0001000;
			4'b1011: out = 7'b1100000;
			4'b1100: out = 7'b0110001;
			4'b1101: out = 7'b1000010;
			4'b1110: out = 7'b0110000;
			4'b1111: out = 7'b0111000;
		endcase
	end
endmodule

module div50MHZ(
	input clk,
	input rst,
	output reg clkout
);
	integer cnt;
	always @(posedge clk or posedge rst) begin
		if(rst)
		begin
			cnt <= 0;
			clkout <= 1'b0;
		end
		if(clk)
		begin
			if(cnt <= 24999 && cnt>= 0) 
				begin
					clkout <= 1'b1;
					cnt <= cnt + 1;
				end
			else if(cnt >=25000 && cnt <= 49999) 
				begin
					clkout <= 1'b0;
					cnt <= cnt + 1;
				end
			else
				begin
					cnt<=0;
				end
		end
		
	end
endmodule

