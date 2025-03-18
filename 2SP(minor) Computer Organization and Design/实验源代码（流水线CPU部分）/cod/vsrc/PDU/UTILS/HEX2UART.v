module HEX2UART (
    input                   [ 0 : 0]            clk,
    input                   [ 0 : 0]            rst,


    // HEX Data
    input                   [31 : 0]            hex_data,
    input                   [ 0 : 0]            hex_data_valid,
    output      reg         [ 0 : 0]            hex_data_accept,

    // Uart TX data
    output      reg         [ 7 : 0]            tx_data,
    output      reg         [ 0 : 0]            tx_data_valid
);  

reg [ 3 : 0]    counter;
reg [31 : 0]    local_hex_data;

always @(posedge clk) begin
    if (rst)
        local_hex_data <= 0;
    else if (hex_data_valid)
        local_hex_data <= hex_data;
    else if (counter < 8)
        local_hex_data <= {local_hex_data[27 : 0], 4'B0};
end

always @(posedge clk) begin
    if (rst)
        counter <= 8;
    else if (hex_data_valid)
        counter <= 7;
    else if (counter == 0)
        counter <= 8;
    else if (counter < 8)
        counter <= counter - 1;
end

always @(*) begin
    tx_data = 0;

    case (local_hex_data[31 : 28])
        4'H0: tx_data = "0";
        4'H1: tx_data = "1";
        4'H2: tx_data = "2";
        4'H3: tx_data = "3";
        4'H4: tx_data = "4";
        4'H5: tx_data = "5";
        4'H6: tx_data = "6";
        4'H7: tx_data = "7";
        4'H8: tx_data = "8";
        4'H9: tx_data = "9";
        4'HA: tx_data = "A";
        4'HB: tx_data = "B";
        4'HC: tx_data = "C";
        4'HD: tx_data = "D";
        4'HE: tx_data = "E";
        4'HF: tx_data = "F";
    endcase

end

always @(*) begin
    tx_data_valid = (counter < 8);
end

always @(*)
    hex_data_accept = (counter == 0);


endmodule