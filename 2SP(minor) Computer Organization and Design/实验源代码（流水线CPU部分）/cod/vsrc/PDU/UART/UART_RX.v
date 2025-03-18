// 115200 8N1 UART receiver
`define		DISABLED			3'h7
`define		IDLE				3'h0
`define		RECEIVING_START		3'h1
`define		RECEIVING_BITS		3'h2
`define		RECEIVING_END		3'h3

module
	UART_RX (
		input clk, rst,
		input en,

		input uart_rxd,

		output reg ready,
		output reg [7 : 0] data
	);

	reg [2 : 0] status_cur;
	reg [9 : 0] counter;
	reg [2 : 0] bits_counter;

	initial begin
		status_cur = `DISABLED;
		ready = 0;
		data = 0;
		counter = 0;
		bits_counter = 0;
	end

	always @(posedge clk) begin
		if(rst | ~en) begin
			status_cur <= `DISABLED;
			ready <= 0;
			data <= 0;
			counter <= 0;
			bits_counter <= 0;
		end
		else begin
			case(status_cur)
				`DISABLED : begin
					status_cur <= `IDLE;
					ready <= 0;
					data <= 0;
					counter <= 0;
					bits_counter <= 0;
				end
				`IDLE : begin
					if(!uart_rxd) status_cur <= `RECEIVING_START;
					counter <= 0;
				end
				`RECEIVING_START : begin
					if(counter == 217) begin
						counter <= 0;
						status_cur <= `RECEIVING_BITS;
					end
					else begin
						counter <= counter + 1;
					end
					ready <= 0;
					bits_counter <= 0;
				end
				`RECEIVING_BITS : begin
					if(counter == 434) begin
						if(bits_counter == 7) begin
							status_cur <= `RECEIVING_END;
						end
						bits_counter <= bits_counter + 1;
						counter <= 0;
						data <= {uart_rxd, data[7 : 1]};
					end
					else begin
						counter <= counter + 1;
					end
				end
				`RECEIVING_END : begin
					if(counter == 434) begin
						status_cur <= `IDLE;
						ready <= uart_rxd;
					end
					else begin
						counter <= counter + 1;
					end
				end
				default : begin
					status_cur <= `DISABLED;
					ready <= 0;
					data <= 0;
					counter <= 0;
					bits_counter <= 0;
				end
			endcase
		end
	end

endmodule
