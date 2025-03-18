module COUNTER16(CLK_50M,RST,DOUT);
	input CLK_50M,RST;
	output [3:0] DOUT;
	reg [3:0] d;
	wire CLK_1Hz;
	
	clk_divider U1(CLK_50M,CLK_1Hz);
	assign DOUT=d;
	always @(posedge CLK_1Hz or negedge RST)
		begin
		if(!RST)d<=4'b0000;
		else d<=d+1;
	end
endmodule

module clk_divider(clk_in,clk_out);
	input clk_in;
	output reg clk_out;
	reg [24:0] counter;
	
	always @(posedge clk_in)
	begin
		counter <=counter+1;
		if(counter==50000000/2-1)
		begin
			counter<=0;
			clk_out<=~clk_out;
		end
	end
endmodule
/*
module FPGA_EXP1(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7);
	input a,b,c;
	output y0,y1,y2,y3,y4,y5,y6,y7;
	reg y0,y1,y2,y3,y4,y5,y6,y7;
	always @(a or b or c)
	begin
		y0= 1'b1; y1= 1'b1; y2= 1'b1; y3= 1'b1;
		y4= 1'b1; y5= 1'b1; y6= 1'b1; y7= 1'b1;
		case ({a,b,c})
			3'b000: y0 <= 1'b0;
			3'b001: y1 <= 1'b0;
			3'b010: y2 <= 1'b0;
			3'b011: y3 <= 1'b0;
			3'b100: y4 <= 1'b0;
			3'b101: y5 <= 1'b0;			
			3'b110: y6 <= 1'b0;
			3'b111: y7 <= 1'b0;
		endcase
	end
endmodule
*/