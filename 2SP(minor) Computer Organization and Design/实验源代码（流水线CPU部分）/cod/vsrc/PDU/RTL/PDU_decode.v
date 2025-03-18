/*
==========================================================================================================
数据访存指令
==========================================================================================================

读取指令存储器: RI <base>_16 <length>_10;，从 base 开始读取连续的 length 个存储单元。length <= 32
e.g.    RI 3000 10;
读取数据存储器: RD <base>_16 <length>_10;，从 base 开始读取连续的 length 个存储单元。length <= 32
e.g.    RD 0000 10;
写入指令存储器: WI <base>_16 <length>_10 <code>_16;，从 base 开始写入连续的 length 个存储单元。length <= 32，不足补 0
e.g.    WI  3000 2 1234 1234;
写入数据存储器: WD <base>_16 <length>_10 <code>_16;，从 base 开始写入连续的 length 个存储单元。length <= 32，不足补 0
e.g.    WI  3000 2 1234 1234;
读取寄存器堆: RR;，读取全部的 32 个寄存器
e.g.    RR;
写入寄存器堆: WR <id>_10，<data>_16;，将 data 写入编号为 id 寄存器(R0 恒 0)
e.g.    WR 3 0;


==========================================================================================================
CPU 控制指令
==========================================================================================================

断点指令:   
    B <addr>_16;，设置 addr 为断点
    B 100001 10002 10003;

    B;，显示当前断点地址
单步运行: S;，执行一条指令
连续运行: R;，运行至断点或程序末尾
停止执行: H;，停止 CPU 活动（优先级最高）
*/

module PDU_DECODE (
    input                   [ 0 : 0]            clk                 ,
    input                   [ 0 : 0]            rst                 ,

    // UART RX
    input                   [ 0 : 0]            rx_data_valid       ,
    input                   [ 7 : 0]            rx_data             ,

    // Memory
    output          reg     [ 0 : 0]            imem_read           ,
    output          reg     [ 0 : 0]            dmem_read           ,
    output          reg     [ 0 : 0]            imem_write          ,
    output          reg     [ 0 : 0]            dmem_write          ,
    output          reg     [ 0 : 0]            reg_read            ,
    output          reg     [31 : 0]            base_addr           ,
    output          reg     [31 : 0]            length              ,

    // Breakpoint
    output          reg     [ 0 : 0]            bp_set              ,
    output          reg     [ 0 : 0]            bp_list             ,
    output          reg     [ 0 : 0]            bp_clear            ,   

    // CPU
    output          reg     [ 0 : 0]            cpu_step            ,
    output          reg     [ 0 : 0]            cpu_run             ,
    output          reg     [ 0 : 0]            cpu_halt            ,

    // Other
    output          reg     [ 0 : 0]            command_not_found   ,

    // Data transfer (32bits Hex)
    output          reg     [31 : 0]            decode_data         ,
    output          reg     [ 0 : 0]            decode_data_valid   ,
    output          reg     [ 0 : 0]            decode_data_end         
);

    // useful signals
    reg [ 0 : 0]    is_rx_blank, is_rx_dec, is_rx_hex, is_rx_end;
    reg [ 7 : 0]    rx_dec, rx_hex;
    localparam _N = 8'd10;      // "\n"
    localparam _R = 8'd13;      // "\r"

    always @(*) begin
        is_rx_blank     = (rx_data == " " || rx_data == _N);
        is_rx_dec       = (rx_data >= "0" && rx_data <= "9");
        is_rx_hex       = (rx_data >= "0" && rx_data <= "9" || rx_data >= "A" && rx_data <= "F" || rx_data >= "a" && rx_data <= "f");
        is_rx_end       = (rx_data == ";");
        rx_dec          = rx_data - "0";
        rx_hex          = (rx_data >= "A" && rx_data <= "F") ? rx_data - "A" + 8'HA 
                                                            : (rx_data >= "a" && rx_data <= "f") ? rx_data - "a" + 8'HA
                                                                                                : rx_dec;
    end


    // FSM
    reg [ 8 : 0]    decode_cs, decode_ns, decode_ls;
    reg [ 3 : 0]    counter;
    reg [ 1 : 0]    access_flag;

    localparam ACCESS_IM = 0;
    localparam ACCESS_DM = 1;
    localparam ACCESS_RF = 2;

    localparam WAIT     =  0;
    localparam R_1      =  1;
    localparam W_1      =  2;
    localparam B_1      =  3;
    localparam S_1      =  4;
    localparam H_1      =  5;

    localparam NOT_FOUND    = 7;

    localparam RI_INIT      = 10;
    localparam R_ADDR      = 11;
    localparam R_LEN       = 12;
    localparam R_DONE      = 13;

    localparam RD_INIT      = 20;

    localparam RR_INIT      = 21;

    localparam WI_INIT      = 30;
    localparam W_ADDR      = 31;
    localparam W_LEN       = 32;
    localparam W_INFO_1    = 33;
    localparam W_INFO_2    = 34;
    localparam W_DATA      = 35;
    localparam W_SEND      = 36;
    localparam W_DONE      = 37;

    localparam WD_INIT      = 40;

    localparam BP_LIST      = 41;
    localparam BP_SET       = 42;
    localparam BP_CLEAR     = 43;
    localparam PRE_BP_LIST  = 44;
    localparam PRE_BP_SET   = 45;
    localparam PRE_BP_CLEAR = 46;

    localparam STEP         = 50;
    localparam RUN          = 51;
    localparam HALT         = 52;


    always @(posedge clk) begin
        if (rst)
            decode_cs <= WAIT;
        else
            decode_cs <= decode_ns;
    end

    always @(posedge clk) begin
        if (rst)
            decode_ls <= WAIT;
        else
            decode_ls <= decode_cs;
    end

    always @(*) begin
        decode_ns = decode_cs;

        case (decode_cs)
            WAIT: if (rx_data_valid)
                case (rx_data)
                    "R":        decode_ns = R_1;
                    "W":        decode_ns = W_1;
                    "B":        decode_ns = B_1;
                    "S":        decode_ns = S_1;
                    "H":        decode_ns = H_1;
                    default:    decode_ns = WAIT;
                endcase

            R_1: if (rx_data_valid)
                case (rx_data)
                    "I":        decode_ns = RI_INIT;
                    "D":        decode_ns = RD_INIT;
                    "R":        decode_ns = RR_INIT;
                    ";":        decode_ns = RUN;
                    default:    decode_ns = WAIT;
                endcase

            W_1: if (rx_data_valid)
                case (rx_data)
                    "I":        decode_ns = WI_INIT;
                    "D":        decode_ns = WD_INIT;
                    default:    decode_ns = WAIT;
                endcase

            B_1: 
                if (rx_data_valid) begin
                    case (rx_data)
                        "L":    decode_ns = PRE_BP_LIST;
                        "C":    decode_ns = PRE_BP_CLEAR;
                        "S":    decode_ns = BP_SET;
                        default:    decode_ns = WAIT;
                    endcase
                end

            S_1: 
                if (rx_data_valid) begin
                    if (is_rx_end)
                        decode_ns = STEP;
                    else
                        decode_ns = WAIT;
                end 

            H_1:
                if (rx_data_valid) begin
                    if (is_rx_end)
                        decode_ns = HALT;
                    else
                        decode_ns = WAIT;
                end
                    


            // RI -------------------------------------------------------------------
            RI_INIT: if (rx_data_valid && is_rx_blank)
                decode_ns = R_ADDR;
            
            R_ADDR: if (rx_data_valid && is_rx_blank)
                decode_ns = R_LEN;

            R_LEN: if (rx_data_valid && is_rx_end)
                decode_ns = R_DONE;
            
            R_DONE:    decode_ns = WAIT;


            // RD -------------------------------------------------------------------
            RD_INIT: if (rx_data_valid && is_rx_blank)
                decode_ns = R_ADDR;

            // RR -------------------------------------------------------------------
            RR_INIT: if (rx_data_valid && is_rx_blank)
                decode_ns = R_ADDR;


            // WI -------------------------------------------------------------------
            WI_INIT: if (rx_data_valid && is_rx_blank)
                decode_ns = W_ADDR;
            
            W_ADDR: if (rx_data_valid && is_rx_blank)
                decode_ns = W_LEN;

            W_LEN: 
                if (rx_data_valid && is_rx_blank)
                    decode_ns = W_INFO_1;
                else if (rx_data_valid && is_rx_end)
                    decode_ns = W_INFO_2;

            W_INFO_1:
                decode_ns = W_DATA;

            W_INFO_2: 
                if (!(|counter))
                    decode_ns = W_DONE;

            W_DATA:
                if (rx_data_valid) begin
                    if (is_rx_blank)
                        decode_ns = W_SEND;
                    else if (is_rx_end)
                        decode_ns = W_DONE;
                end

            W_SEND:
                decode_ns = W_DATA;

            W_DONE:
                decode_ns = WAIT;


            // WD -------------------------------------------------------------------
            WD_INIT: if (rx_data_valid && is_rx_blank)
                decode_ns = W_ADDR;

            
            // Breakpoint -------------------------------------------------------------------
            PRE_BP_LIST:
                if (rx_data_valid && is_rx_end)
                    decode_ns = BP_LIST;

            PRE_BP_CLEAR:
                if (rx_data_valid && is_rx_end)
                    decode_ns = BP_CLEAR;

            BP_LIST, BP_CLEAR:
                decode_ns = WAIT;

            BP_SET:
                if (rx_data_valid && is_rx_blank)
                    decode_ns = W_DATA;

            // STEP -------------------------------------------------------------------

            STEP, RUN, HALT:
                decode_ns = WAIT;
            

            NOT_FOUND:
                decode_ns = WAIT;

        endcase
    end


    always @(posedge clk) begin
        if (rst)
            access_flag <= ACCESS_IM;
        else if (decode_cs == RI_INIT || decode_cs == WI_INIT)
            access_flag <= ACCESS_IM;
        else if (decode_cs == RD_INIT || decode_cs == WD_INIT)
            access_flag <= ACCESS_DM;
        else if (decode_cs == RR_INIT)
            access_flag <= ACCESS_RF;
    end

    always @(*) begin
        imem_read   = 0;
        imem_write  = 0;
        dmem_read   = 0;
        dmem_write  = 0;
        reg_read    = 0;

        if (decode_ls == W_LEN && (decode_cs == W_INFO_1 || decode_cs == W_INFO_2)) begin
            imem_write = (access_flag == ACCESS_IM);
            dmem_write = (access_flag == ACCESS_DM);
        end
        if (decode_ls == R_LEN && decode_cs == R_DONE) begin
            imem_read   = (access_flag == ACCESS_IM);
            dmem_read   = (access_flag == ACCESS_DM);
            reg_read    = (access_flag == ACCESS_RF);
        end
    end

    always @(*) begin
        bp_set      = (decode_cs == BP_SET);
        bp_list     = (decode_cs == BP_LIST);
        bp_clear    = (decode_cs == BP_CLEAR);
    end

    always @(*) begin
        cpu_step    = (decode_cs == STEP);
        cpu_run     = (decode_cs == RUN)    ;
        cpu_halt    = (decode_cs == HALT)   ;
    end

    always @(*)
        command_not_found = (decode_cs == NOT_FOUND);




    // ASCII ---> HEX/DEC

    reg     [31 : 0]   rx_data_hex, rx_data_dec;
    always @(posedge clk) begin
        if (rst)
            rx_data_hex <= 0;
        else if ((decode_cs == R_ADDR || decode_cs == W_ADDR || decode_cs == W_DATA))
            if (rx_data_valid && is_rx_hex)
                rx_data_hex <= (rx_data_hex << 4) | {24'B0, rx_hex};
            else
                rx_data_hex <= rx_data_hex;
        else
            rx_data_hex <= 0;
    end

    always @(posedge clk) begin
        if (rst)
            rx_data_dec <= 0;
        else if ((decode_cs == R_LEN || decode_cs == W_LEN))
            if (rx_data_valid && is_rx_dec)
                rx_data_dec <= (rx_data_dec * 10) + {24'B0, rx_dec};
            else
                rx_data_dec <= rx_data_dec;
        else
            rx_data_dec <= 0;
    end


    always @(posedge clk) begin
        if (rst)
            base_addr <= 0;
        else if (decode_cs == R_ADDR && decode_ns == R_LEN
            ||   decode_cs == W_ADDR && decode_ns == W_LEN)
            base_addr <= rx_data_hex;
    end

    always @(posedge clk) begin
        if (rst)
            length <= 0;
        else if (decode_cs == R_LEN && decode_ns == R_DONE
            ||   decode_cs == W_LEN && (decode_ns == W_INFO_1 || decode_ns == W_INFO_2))
            length <= rx_data_dec;
    end


    always @(*) begin
        decode_data = 0;
        decode_data_valid = 0;
        decode_data_end = (decode_cs == W_DONE);
        if (decode_ls == W_DATA && (decode_cs == W_SEND || decode_cs == W_DONE)) begin
            decode_data = rx_data_hex;
            decode_data_valid = 1;
        end     
    end


    always @(posedge clk) begin
        if (rst)
            counter <= 0;
        else if (decode_cs == WI_INIT || decode_cs == WD_INIT) 
            counter <= 3;
        else if (decode_cs == W_INFO_2)
            counter <= counter - 1;
    end
endmodule