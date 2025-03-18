`timescale 10ns/1ns

module FPGA_EXP4 (
    input clk,
    input rst,
    input [3:0] row_signal,
    output [3:0] col_signal,
    output [6:0] LED_data,
    output LED_sel
);
wire clk2;
div50MHZ div(
    .clk(clk),
    .clkout(clk2),
    .rst(rst)
);

FPGA_EXP4_core fpga(
    .clk(clk2),
    .rst(rst),
    .row_signal(row_signal),
    .col_signal(col_signal),
    .LED_data(LED_data),
    .LED_sel(LED_sel)
);

endmodule

module FPGA_EXP4_core (
    input clk,
    input rst,
    input [3:0] row_signal,
    output reg [3:0] col_signal,
    output [6:0] LED_data,
    output LED_sel
);
reg [1:0] st;
reg [3:0] position;
wire [3:0] data;
assign LED_sel=1;
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        st<=0;
    end
    else begin
        case (st)
            2'b00:begin
                st<=2'b01;
                col_signal<=4'b1110;
            end 
            2'b01:begin
                st<=2'b10;
                col_signal<=4'b1101;
            end
            2'b10:begin
                st<=2'b11;
                col_signal<=4'b1011;
            end
            2'b11:begin
                st<=2'b00;
                col_signal<=4'b0111;
            end
            default: begin
                st<=2'b00;
            end
        endcase
    end
end

always @(negedge clk or negedge rst) begin
    if(!rst) begin
        position<=4'b1101;
    end
    else begin
        case (row_signal)
        4'b1110: begin
            position[3:2]<=2'b00; 
            case (col_signal)
                4'b1110: position[1:0]<=2'b00;
                4'b1101: position[1:0]<=2'b01;
                4'b1011: position[1:0]<=2'b10;
                4'b0111: position[1:0]<=2'b11;
                4'b1111: position[1:0]<=position[1:0];
                default: position[1:0]<=2'b00;
            endcase
        end
        4'b1101: begin 
            position[3:2]<=2'b01;
            case (col_signal)
                4'b1110: position[1:0]<=2'b00;
                4'b1101: position[1:0]<=2'b01;
                4'b1011: position[1:0]<=2'b10;
                4'b0111: position[1:0]<=2'b11;
                4'b1111: position[1:0]<=position[1:0];
                default: position[1:0]<=2'b00;
            endcase 
        end
        4'b1011: begin
            position[3:2]<=2'b10;
            case (col_signal)
                4'b1110: position[1:0]<=2'b00;
                4'b1101: position[1:0]<=2'b01;
                4'b1011: position[1:0]<=2'b10;
                4'b0111: position[1:0]<=2'b11;
                4'b1111: position[1:0]<=position[1:0];
                default: position[1:0]<=2'b00;
            endcase
        end
        4'b0111: begin
            position[3:2]<=2'b11;
            case (col_signal)
                4'b1110: position[1:0]<=2'b00;
                4'b1101: position[1:0]<=2'b01;
                4'b1011: position[1:0]<=2'b10;
                4'b0111: position[1:0]<=2'b11;
                4'b1111: position[1:0]<=position[1:0];
                default: position[1:0]<=2'b00;
            endcase
        end
        4'b1111: position<=position;
        default: position<=4'b1101;
        endcase
    end
end

position_data pos_data(
    .position(position),
    .data(data)
);

LED_decoder decoder(
    .in(data),
    .out(LED_data)
);

endmodule

module position_data (
    input [3:0] position,
    output reg [3:0] data
);
    always @(position) begin
        case (position)
            4'b0000:data<=4'b0001;//1 
            4'b0001:data<=4'b0010;//2 
            4'b0010:data<=4'b0011;//3 
            4'b0011:data<=4'b1010;//A(10) 
            4'b0100:data<=4'b0100;//4 
            4'b0101:data<=4'b0101;//5 
            4'b0110:data<=4'b0110;//6 
            4'b0111:data<=4'b1011;//B(11) 
            4'b1000:data<=4'b0111;//7 
            4'b1001:data<=4'b1000;//8
            4'b1010:data<=4'b1001;//9 
            4'b1011:data<=4'b1100;//C(12) 
            4'b1100:data<=4'b0000;//* 
            4'b1101:data<=4'b0000;//0 
            4'b1110:data<=4'b0000;//# 
            4'b1111:data<=4'b1101;//D(13) 
            default:data<=4'b0000;//0
        endcase
    end
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
	always @(posedge clk or negedge rst) begin
		if(!rst)
		begin
			cnt <= 0;
			clkout <= 1'b0;
		end
        else 
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