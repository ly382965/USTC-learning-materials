module example(
    input [3:0]             num1, num2,
    input                   sel,
    output reg [3:0]        out,
);

always @(*) begin
    if (sel)
        out = num1;
    else
        out = num2;
end
endmodule