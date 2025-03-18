module BP_LIST_REG (
    input                   [ 0 : 0]            clk         ,
    input                   [ 0 : 0]            rst         ,

    // write
    input                   [31 : 0]            bp_addr     ,
    input                   [ 0 : 0]            bp_we       ,

    input                   [ 0 : 0]            bp_clear    ,
    input                   [ 0 : 0]            reach_bp    ,

    // read
    output          reg     [31 : 0]            bp_0        ,
    output          reg     [31 : 0]            bp_1        ,
    output          reg     [31 : 0]            bp_2        ,

    output          reg     [ 2 : 0]            bp_valid
);

always @(posedge clk) begin
    if (rst)
        bp_valid <=  3'B000;
    else if (bp_clear)
        bp_valid <=  3'B000;
    else if (reach_bp)
        bp_valid <= {1'B0, bp_valid[2:1]};
    else if (bp_we) begin
        if (~bp_valid[0])
            bp_valid[0] <= 1;
        else if (~bp_valid[1])
            bp_valid[1] <= 1;
        else if (~bp_valid[2])
            bp_valid[2] <= 1;
    end
end

always @(posedge clk) begin
    if (rst)
        bp_0 <= 0;
    else if (bp_clear)
        bp_0 <= 0;
    else if (reach_bp)
        bp_0 <= bp_1;
    else if (bp_we && ~bp_valid[0])
        bp_0 <= bp_addr;
end

always @(posedge clk) begin
    if (rst)
        bp_1 <= 0;
    else if (bp_clear)
        bp_1 <= 0;
    else if (reach_bp)
        bp_1 <= bp_2;
    else if (bp_we && ~bp_valid[1] && bp_valid[0])
        bp_1 <= bp_addr;
end

always @(posedge clk) begin
    if (rst)
        bp_2 <= 0;
    else if (bp_clear || reach_bp)
        bp_2 <= 0;
    else if (bp_we && ~bp_valid[2] && bp_valid[0] && bp_valid[1])
        bp_2 <= bp_addr;
end
endmodule