module mem#(
    parameter INDEX_WIDTH       = 3,    // Cache索引位宽 2^3=8行
    parameter LINE_OFFSET_WIDTH = 2,    // 行偏移位宽，决定了一行的宽度 2^2=4字
    parameter SPACE_OFFSET      = 2,    // 一个地址空间占1个字节，因此一个字需要4个地址空间，由于假设为整字读取，处理地址的时候可以默认后两位为0
    parameter MEM_ADDR_WIDTH    = 10,   // 为了简化，这里假设内存地址宽度为10位（CPU请求地址仍然是32位，只不过我们这里简化处理，截断了高位） 
    parameter WAY_NUM           = 1     // Cache N路组相联(N=1的时候是直接映射)
)(
    input  clk,
    input  rstn,
    input  mem_r,
    input  mem_w,
    input  [31:0] mem_addr,
    input  [127:0] mem_w_data,  // 内存写数据 一次写一行
    output [127:0] mem_r_data,  // 内存读数据 一次读一行
    output reg                         mem_ready  // 内存就绪信号
);
    localparam LINE_WIDTH = 32 << LINE_OFFSET_WIDTH;
    localparam cnt_max = 5; // ! 更改这个值可以模拟不同的延迟，为了仿真方便可以设置成5

    wire [MEM_ADDR_WIDTH - 1:0] addr;
    assign addr = mem_addr[MEM_ADDR_WIDTH+LINE_OFFSET_WIDTH + SPACE_OFFSET:LINE_OFFSET_WIDTH + SPACE_OFFSET];
    wire [LINE_WIDTH - 1:0] mem_data;
    wire [LINE_WIDTH - 1:0] mem_wdata;
    

    // 状态机 模拟内存命中延迟，每次读写均有延迟
    reg [5:0] cnt;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnt <= 0;
            mem_ready <= 0;
        end else begin
            if (cnt == cnt_max) begin
                cnt <= 0;
                mem_ready <= 1;
            end else if (mem_r || mem_w) begin
                cnt <= cnt + 1;
                mem_ready <= 0;
            end
            else begin
                cnt <= 0;
                mem_ready <= 0;
            end
        end
    end

    assign mem_r_data = mem_ready ? mem_data : 0;
    assign mem_wdata = (mem_w && (cnt == cnt_max)) ? mem_w_data : 0;
    
    //例化bram_mem
    mem_bram #(
        .ADDR_WIDTH(MEM_ADDR_WIDTH),
        .DATA_WIDTH(LINE_WIDTH)
    ) mem_bram(
        .clk(clk),
        .raddr(addr),
        .waddr(addr),
        .din(mem_wdata),
        .we(mem_w && (cnt == cnt_max)),
        .dout(mem_data)
    );

endmodule
