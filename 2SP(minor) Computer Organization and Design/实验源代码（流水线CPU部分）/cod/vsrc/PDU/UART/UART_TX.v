// 115200 8N1 UART transmitter
`define		DISABLED			3'h7
`define		IDLE				3'h0
`define		SENDING_START		3'h1
`define		SENDING_BITS		3'h2
`define		SENDING_END			3'h3

module
	UART_TX (
		input clk, rst,
		input en, ready, // ready is 1 if data is prepared

		input [7 : 0] data,

		output uart_txd,
		output reg transmitted
	);

	reg [2 : 0] status_cur;
	reg [9 : 0] counter;
	reg [2 : 0] bits_counter;

	initial begin
		status_cur = `DISABLED;
		counter = 0;
		bits_counter = 0;
		transmitted = 0;
	end

	always @(posedge clk) begin
		if (rst | ~en) begin
			status_cur <= `DISABLED;
			counter <= 0;
			bits_counter <= 0;
			transmitted <= 0;
		end
		else begin
			case(status_cur)
				`DISABLED : begin
					status_cur <= `IDLE;
					counter <= 0;
					bits_counter <= 0;
					transmitted <= 0;
				end
				`IDLE : begin
					if (ready) begin
						status_cur <= `SENDING_START;
						counter <= 0;
					end
				end
				`SENDING_START : begin
					if (counter == 434) begin
						status_cur <= `SENDING_BITS;
						counter <= 0;
						bits_counter <= 0;
					end
					else begin
						counter <= counter + 1;
					end
				end
				`SENDING_BITS : begin
					if (counter == 434) begin
						if (bits_counter == 7) begin
							transmitted <= 1;
							status_cur <= `SENDING_END;
						end
						bits_counter <= bits_counter + 1;
						counter <= 0;
					end
					else begin
						counter <= counter + 1;
					end
				end
				`SENDING_END : begin
					if (counter == 434) begin
						status_cur <= `IDLE;
						transmitted <= 0;
						counter <= 0;
					end
					else begin
						counter <= counter + 1;
					end
				end
				default : begin
					status_cur <= `DISABLED;
					counter <= 0;
					bits_counter <= 0;
					transmitted <= 0;
				end
			endcase
		end
	end

	assign uart_txd = status_cur == `SENDING_BITS ? data[bits_counter] : (status_cur == `SENDING_START ? 0 : 1);

endmodule

