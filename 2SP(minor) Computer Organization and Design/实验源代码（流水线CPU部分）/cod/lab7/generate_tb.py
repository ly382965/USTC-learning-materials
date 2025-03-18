# 本文件的作用主要为了生成测试文件mem_bram.v和cache_tb.v
# 生成的mem_bram.v文件主要是初始化内存中的数据，用于后续的随机读写操作
# 生成的cache_tb.v文件主要是模拟CPU对cache的读写操作，用于验证cache的正确性

# 定义一些仿真文件参数
MODE = 1 # 0:随机读写 1：模拟CPU伪顺序读写（会有不定期跳转，概率为BranchP）
BranchP = 0.1 # 跳转概率，仅在MODE=1时有效，当BranchP = 0时，为顺序读写不会跳转
READ_NUM   = 2000 # 读取次数
WRITE_NUM  = 1000 # 写入次数

# 内存参数
WORD_WIDTH = 32 # 内存数据宽度
DATA_WIDTH = 128 # 一行数据宽度

# cache参数
INDEX_WIDTH = 3
LINE_OFFSET_WIDTH = 2
SPACE_OFFSET = 2
MEM_ADDR_WIDTH = 10
WAY_NUM = 1
# 生成mem_bram.v文件
from random import randint

mem_bram_head = '''
`timescale 1ns/1ps
module mem_bram #(
    parameter ADDR_WIDTH = 10,		//地址宽度
    parameter DATA_WIDTH = 128		//数据宽度
)(
    input                   clk,   // Clock
    input [ADDR_WIDTH-1:0]  raddr,  // Address
    input [ADDR_WIDTH-1:0]  waddr,  // Address
    input [DATA_WIDTH-1:0]  din,   // Data Input
    input                   we,    // Write Enable
    output [DATA_WIDTH-1:0] dout   // Data Output
); 
    reg [ADDR_WIDTH-1:0] addr_r;  // Address Register
    reg [DATA_WIDTH-1:0] ram [0:(1 << ADDR_WIDTH)-1];
    integer i;
    initial begin
'''

mem_bram_tail = '''
    end
    always @(posedge clk) begin
        addr_r <= raddr;
        if(we) ram[waddr] <= din;
    end
    assign dout = ram[addr_r]; 

endmodule
'''

mem= {} # 内存数据，地址为4对齐(即低2位为0), 数据为32位
for i in range(1 << MEM_ADDR_WIDTH):
    mem[i] = randint(0, 2**WORD_WIDTH-1)

with open('./src/mem_bram.v', 'w', encoding="utf-8") as f:
    f.write(mem_bram_head)
    # 根据LINE_OFFSET_WIDTH，将多个内存数据合并成一行
    for i in range(0, 1 << MEM_ADDR_WIDTH, 1 << LINE_OFFSET_WIDTH):
        for j in range(1 << LINE_OFFSET_WIDTH):
            f.write('        ram[%d][%d:%d] = 32\'d%d;\n' % ((i+j)>>SPACE_OFFSET, (j+1)*WORD_WIDTH-1, j*WORD_WIDTH, mem[i+j]))
    f.write(mem_bram_tail)

# 生成cache_tb.v文件
cache_tb_head = '''
/*
本文件是一个测试文件，用于测试cache模块
工作原理是模仿CPU的读写请求，对cache进行读写操作
将Cache返回的数据与预先数据进行比较，如果一致则测试通过
*/
`timescale 1ns/1ps
module cache_tb();

'''

cache_tb_body = '''
    // 变化的信号 CPU发出
    reg clk=1;
    reg rstn=1;
    reg stat=0;
    // 等rstn信号稳定后 clk信号才开始翻转
    initial begin
        #1 rstn = 0;
        #1 rstn = 1;
        stat = 1;
    end
    always  #1 clk = ~clk;

    wire [31:0] addr;
    wire r_req;
    wire w_req;
    wire [31:0] w_data;

    // 导线
    wire [31:0] r_data;
    wire miss;
    wire mem_r;
    wire mem_w;
    wire [31:0] mem_addr;
    wire [127:0] mem_w_data;
    wire [127:0] mem_r_data;
    wire mem_ready;

    // 用于测试的信号
    reg [MEM_ADDR_WIDTH-1:0] test_addr[0:READ_NUM+WRITE_NUM-1];  // 用于存储测试地址
    reg [32:0] test_data[0:READ_NUM+WRITE_NUM-1];  // 用于存储测试数据 最高位用于标记是否写入 0：读 1：写
    reg [31:0] test_cnt=0;  // 用于计数，每次读写操作后加1
    reg diff=0;  // 用于标记是否有不一致的数据

    // 用于对比的提交，当前cache应该给出的数据
    wire op;
    wire[31:0] data;
    assign op = test_data[test_cnt-1][32];
    assign data = test_data[test_cnt-1][31:0];
    
    // 状态机
    assign addr = test_addr[test_cnt]<<SPACE_OFFSET;
    assign r_req = test_data[test_cnt][32] == 0 ? 1 : 0;
    assign w_req = test_data[test_cnt][32] == 1 ? 1 : 0;
    assign w_data = test_data[test_cnt][31:0];
    always @(posedge clk) begin
        if (!miss && (test_cnt < READ_NUM+WRITE_NUM) && stat) begin
            if (test_data[test_cnt-1][32] == 0) begin  // 读
                if (r_data != test_data[test_cnt-1][31:0]) begin
                    $display("Read error at %d, expect %h, get %h", test_cnt, test_data[test_cnt-1][31:0], r_data);
                    diff = 1;
                end
            end
            test_cnt <= test_cnt + 1;
        end
    end

    // 例化cache
    cache #(
        .INDEX_WIDTH(INDEX_WIDTH),
        .LINE_OFFSET_WIDTH(LINE_OFFSET_WIDTH),
        .SPACE_OFFSET(SPACE_OFFSET),
        .WAY_NUM(WAY_NUM)
    ) cache_inst(
        .clk(clk),
        .rstn(rstn),
        .addr(addr),
        .r_req(r_req),
        .w_req(w_req),
        .w_data(w_data),
        .r_data(r_data),
        .miss(miss),
        .mem_r(mem_r),
        .mem_w(mem_w),
        .mem_addr(mem_addr),
        .mem_w_data(mem_w_data),
        .mem_r_data(mem_r_data),
        .mem_ready(mem_ready)
    );

    // 内存
    mem #(
        .INDEX_WIDTH(INDEX_WIDTH),
        .LINE_OFFSET_WIDTH(LINE_OFFSET_WIDTH),
        .SPACE_OFFSET(SPACE_OFFSET),
        .MEM_ADDR_WIDTH(MEM_ADDR_WIDTH-LINE_OFFSET_WIDTH),
        .WAY_NUM(WAY_NUM)
    ) mem_inst(
        .clk(clk),
        .rstn(rstn),
        .mem_r(mem_r),
        .mem_w(mem_w),
        .mem_addr(mem_addr),
        .mem_w_data(mem_w_data),
        .mem_r_data(mem_r_data),
        .mem_ready(mem_ready)
    );

    // 初始化测试数据
    initial begin
'''

cache_tb_tail = '''
    end
endmodule
'''

test_data = []
for i in range(READ_NUM):
    test_data.append(0)
for i in range(WRITE_NUM):
    test_data.append(randint(0, 2**WORD_WIDTH-1) | (1 << 32))

# 生成随机读写操作
if MODE == 0:
    test_addr = [randint(0, 2**MEM_ADDR_WIDTH-1) for i in range(READ_NUM+WRITE_NUM)]
elif MODE == 1:
    test_addr = [0]
    return_flag = 0
    ret_test_addr = 0
    for i in range(1, READ_NUM+WRITE_NUM):
        if randint(0, 100) < BranchP*100:
            if return_flag == 0:
                ret_test_addr = test_addr[i-1]
                return_flag = 1
                test_addr.append(randint(0, 2**MEM_ADDR_WIDTH-1))
            elif return_flag == 1:
                test_addr.append(ret_test_addr + 1)
                return_flag = 0
        else:
            test_addr.append(test_addr[i-1] + 1)
        # 确保地址不超过内存范围
        test_addr[i] = test_addr[i] % (2**MEM_ADDR_WIDTH)

# debug
# print(test_addr)
# print(len(test_addr))
# print(test_data)
# print(len(test_data))

# 打乱test_data顺序
from random import shuffle
shuffle(test_data)
with open('./src/cache_tb.v', 'w', encoding="utf-8") as f:
    f.write(cache_tb_head)
    f.write("    //测试参数\n")
    f.write("    parameter READ_NUM = %d;  // 测试次数 这里设置为2000次读，1000次写\n" % READ_NUM)
    f.write("    parameter WRITE_NUM = %d;  \n" % WRITE_NUM)
    f.write("    //模块参数\n")
    f.write("    parameter INDEX_WIDTH       = %d;   // Cache索引位宽 2^3=8行\n" % INDEX_WIDTH)
    f.write("    parameter LINE_OFFSET_WIDTH = %d;   // 行偏移位宽，决定了一行的宽度 2^2=4字\n" % LINE_OFFSET_WIDTH)
    f.write("    parameter SPACE_OFFSET      = %d;   // 一个地址空间占1个字节，因此一个字需要4个地址空间，由于假设为整字读取，处理地址的时候可以默认后两位为0\n" % SPACE_OFFSET)
    f.write("    parameter MEM_ADDR_WIDTH    = %d;   // 为了简化，这里假设内存地址宽度为10位（CPU请求地址仍然是32位，只不过我们这里简化处理，截断了高位） \n" % MEM_ADDR_WIDTH)
    f.write("    parameter WAY_NUM           = %d;   // Cache N路组相联(N=1的时候是直接映射)\n" % WAY_NUM)
    f.write(cache_tb_body)
    for i in range(READ_NUM+WRITE_NUM):
        f.write('        test_addr[%d] = %d;\n' % (i, test_addr[i]))
        # 模拟写入数据修改mem中的数据
        if test_data[i] >> 32 == 1:
            mem[test_addr[i]] = test_data[i] & 0xffffffff
            f.write('        test_data[%d] = 33\'d%d;\n' % (i, test_data[i]))
        else:
            f.write('        test_data[%d] = 33\'d%d;\n' % (i, mem[test_addr[i]]))
    f.write(cache_tb_tail)
