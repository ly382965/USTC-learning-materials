module my_MEM (
    input       [ 0 : 0]                clk,
    input       [ 9 : 0]                a,
    output      [31 : 0]                spo,
    input       [ 0 : 0]                we,
    input       [31 : 0]                d
);

    reg                 [31 : 0]                            mem             [0 : (1 << 10) - 1];

    integer i;
    initial begin
        // $readmemh(`INST_MEM_FILE, mem);
        i = 0;
        while (i < 100) begin
            mem[i] = i;
            i = i + 1;
        end
        mem[0] = 32'H12345678;
        mem[1] = 32'H1ABCDEF1;
    end

    assign spo = mem[a];

    always @(posedge clk)
        if (we)
            mem[a] <= d;

endmodule
