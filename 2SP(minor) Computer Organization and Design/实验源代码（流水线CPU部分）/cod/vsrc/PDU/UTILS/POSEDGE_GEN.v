module POSEDGE_GEN (
		input		clk,

		input		signal,
		output		signal_posedge
	);

	reg signal_delay1, signal_delay2;

	initial begin
		signal_delay1 = 0;
		signal_delay2 = 0;
	end

	always @(posedge clk) begin
		signal_delay1 <= signal;
		signal_delay2 <= signal_delay1;
	end

	assign signal_posedge = signal_delay1 & ~signal_delay2;

endmodule
