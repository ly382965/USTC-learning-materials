`timescale 10ns/1ns

module FPGA_EXP3 (
    input clk,
    input rst,
    input sel,
    output signal,
    output [3:0] debug_st
);
wire seq1;
wire seq2;
wire seq_in;
wire clk2;

div50MHZ div(
    .clk(clk),
    .rst(rst),
    .clkout(clk2)
);

seq_generator gen1(
    .clk(clk2),
    .rst(rst),
    .seq(seq1)
);

seq_generator_2 gen2(
    .clk(clk2),
    .rst(rst),
    .seq(seq2)
);

choose2_1 choose(
    .in1(seq1),
    .in2(seq2),
    .sel(sel),
    .out(seq_in)
);

seq_detector detector(
    .clk(clk2),
    .rst(rst),
    .seq_in(seq_in),
    .seq_out(signal),
    .debug_st(debug_st)
);

endmodule

module seq_generator (
    input clk,
    input rst,
    output reg seq
);
    
reg [3:0] st;
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8;
always @(posedge clk or negedge rst) begin
    if(!rst)
    begin
        st<=s0;
    end
    else begin
        case (st)
            s0:begin st<=s1;seq<=1'b1;end
            s1:begin st<=s2;seq<=1'b1;end
            s2:begin st<=s3;seq<=1'b0;end
            s3:begin st<=s4;seq<=1'b0;end
            s4:begin st<=s5;seq<=1'b0;end
            s5:begin st<=s6;seq<=1'b1;end
            s6:begin st<=s7;seq<=1'b1;end
            s7:begin st<=s8;seq<=1'b0;end
            s8:begin st<=s0;seq<=1'b0;end
            default: begin st<=s0;seq<=1'bx;end
        endcase
    end
end
endmodule

module seq_generator_2 (
    input clk,
    input rst,
    output reg seq
);
    
reg [3:0] st;
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8;
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        st<=s0;
    end
    else begin
        case (st)
            s0:begin st<=s1;seq<=1'b1;end
            s1:begin st<=s2;seq<=1'b1;end
            s2:begin st<=s3;seq<=1'b1;end
            s3:begin st<=s4;seq<=1'b0;end
            s4:begin st<=s5;seq<=1'b1;end
            s5:begin st<=s6;seq<=1'b0;end
            s6:begin st<=s7;seq<=1'b0;end
            s7:begin st<=s8;seq<=1'b1;end
            s8:begin st<=s0;seq<=1'b1;end
            default: begin st<=s0;seq<=1'bx;end
        endcase
    end
end
endmodule

module choose2_1 (
    input in1,
    input in2,
    input sel,
    output reg out
);
   
always @(*) begin
    case (sel)
        1'b0:out<=in1;
        1'b1:out<=in2;
        default: out<=1'bx;
    endcase
end
endmodule

module seq_detector(
    input clk,
    input rst,
    input seq_in,
    output reg seq_out,
    output reg [3:0] debug_st
);
reg [3:0] st;
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        st<=s0;
    end
    else begin
        debug_st<=st;
        case (st)
            s0: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s0;
                    else if(seq_in==1'b1)
                        st<=s1;
                    else
                        st<=s0;
                end
            s1: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s0;
                    else if(seq_in==1'b1)
                        st<=s2;
                    else
                        st<=s0;
                end 
            s2: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s0;
                    else if(seq_in==1'b1)
                        st<=s3;
                    else
                        st<=s0;
                end 
            s3: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s4;
                    else if(seq_in==1'b1)
                        st<=s3;
                    else
                        st<=s0;
                end             
            s4: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s0;
                    else if(seq_in==1'b1)
                        st<=s5;
                    else
                        st<=s0;
                end             
            s5: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s6;
                    else if(seq_in==1'b1)
                        st<=s2;
                    else
                        st<=s0;
                end             
            s6: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s7;
                    else if(seq_in==1'b1)
                        st<=s1;
                    else
                        st<=s0;
                    end             
            s7: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s0;
                    else if(seq_in==1'b1)
                        st<=s8;
                    else
                        st<=s0;
                end             
            s8: begin
                    seq_out<=0;
                    if (seq_in==1'b0) 
                        st<=s0;
                    else if(seq_in==1'b1)
                        st<=s9;
                    else
                        st<=s0;
                end
            s9: begin
                    seq_out<=1;
                    if (seq_in==1'b0) 
                        st<=s0;
                    else if(seq_in==1'b1)
                        st<=s1;
                    else
                        st<=s0;
                end 
            default:begin
                    seq_out<=1'bx;
                    st<=s0;
                    end
        endcase
    end
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
			if(cnt <= 249999 && cnt>= 0) 
				begin
					clkout <= 1'b1;
					cnt <= cnt + 1;
				end
			else if(cnt >=250000 && cnt <= 499999) 
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
