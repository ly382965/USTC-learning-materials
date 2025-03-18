module PDU (
    input                   [ 0 : 0]            clk                 ,
    input                   [ 0 : 0]            rst                 ,


    // With Memory 
    output          reg     [ 0 : 0]            is_pdu              ,

    output          reg     [31 : 0]            pdu_imem_addr       ,
    input                   [31 : 0]            imem_pdu_rdata      ,
    input                   [ 0 : 0]            imem_pdu_rdata_valid,
    output          reg     [ 0 : 0]            pdu_imem_re         ,
    output          reg     [31 : 0]            pdu_imem_wdata      ,
    output          reg     [ 0 : 0]            pdu_imem_we         ,

    output          reg     [31 : 0]            pdu_dmem_addr       ,
    input                   [31 : 0]            dmem_pdu_rdata      ,
    input                   [ 0 : 0]            dmem_pdu_rdata_valid,
    output          reg     [ 0 : 0]            pdu_dmem_re         ,
    output          reg     [31 : 0]            pdu_dmem_wdata      ,
    output          reg     [ 0 : 0]            pdu_dmem_we         ,

    // With CPU
    input                   [ 0 : 0]            cpu_commit_en       ,
    input                   [31 : 0]            cpu_commit_pc       ,
    input                   [31 : 0]            cpu_commit_inst     ,
    input                   [ 0 : 0]            cpu_commit_halt     ,
    output          reg     [ 0 : 0]            cpu_global_en       ,

    // With MMIO
    input                   [ 0 : 0]            mmio_is_halt        ,
    input                   [ 0 : 0]            mmio_pdu_data_valid ,
    input                   [ 7 : 0]            mmio_pdu_data       ,
    output          reg     [ 7 : 0]            pdu_mmio_data       ,
    output          reg     [ 0 : 0]            pdu_mmio_data_ready ,
    input                   [ 0 : 0]            pdu_mmio_data_accept,


    // With Register
    output          reg     [ 4 : 0]            pdu_rf_addr         ,
    input                   [31 : 0]            rf_pdu_data         ,


    // UART
    output          reg     [ 0 : 0]            uart_txd            ,        
    input                   [ 0 : 0]            uart_rxd            



    // Temp
    ,
    output          reg     [31 : 0]            dbg_data
);

    // // With decoder
    // input                   [ 0 : 0]            imem_read       ,
    // input                   [ 0 : 0]            dmem_read       ,
    // input                   [ 0 : 0]            imem_write      ,
    // input                   [ 0 : 0]            dmem_write      ,
    // input                   [ 0 : 0]            rf_read         ,

    // input                   [31 : 0]            decode_base_addr,
    // input                   [31 : 0]            decode_length   ,

    // CORE STATE MACHINE
    localparam STATE_RESET              =   0;

    localparam STATE_SEND_LOGO          =   1;
    localparam STATE_SEND_LINE_HEAD     =   2;
    localparam STATE_ECHO_WAIT_QUEUE    =   3;
    localparam STATE_ECHO_WAIT_CHAR     =   4;
    localparam STATE_ECHO               =   5;
    localparam STATE_N_ECHO             =   6;
    localparam STATE_SEND_ENTER         =   7;
    localparam STATE_WAIT               =   8;

    localparam STATE_RI_INIT            =   10;
    localparam STATE_RD_INIT            =   11;
    localparam STATE_RR_INIT            =   12;
    localparam STATE_R_SEND_ENTER       =   13;
    localparam STATE_R_ADDR_CHECK       =   14;
    localparam STATE_R_READ_M           =   15;
    localparam STATE_R_WAIT_TX          =   16;
    localparam STATE_R_BLANK            =   17;
    localparam STATE_R_DONE             =   18;
    localparam STATE_R_SEND_TX          =   19;
    localparam STATE_R_WAIT_M           =   20;

    localparam STATE_WI_INIT            =   50;
    localparam STATE_WD_INIT            =   51;
    localparam STATE_W_WAIT             =   52;
    localparam STATE_W_DATA             =   53;
    localparam STATE_W_ZERO_1           =   54;
    localparam STATE_W_ZERO_2           =   55;
    localparam STATE_W_ADDR_CHECK       =   56;
    localparam STATE_W_DONE             =   57;

    localparam STATE_BL_ENTER           =   30;
    localparam STATE_BL_SEND_0          =   31;
    localparam STATE_BL_SEND_1          =   32;
    localparam STATE_BL_SEND_2          =   33;
    localparam STATE_BS_ENTER           =   34;
    localparam STATE_BS_SEND_INFO       =   35;
    localparam STATE_BS_WAIT            =   36;
    localparam STATE_BS_DONE            =   37;
    localparam STATE_BC_ENTER           =   38;
    localparam STATE_BC_SEND_INFO       =   39;
    localparam STATE_B_DONE             =   40;

    localparam STATE_STEP_INIT          =   41;
    localparam STATE_STEP_ENABLE        =   42;
    localparam STATE_STEP_ENTER         =   43;
    localparam STATE_STEP_INFO          =   44;
    localparam STATE_STEP_DONE          =   45;

    localparam STATE_RUN_INIT           =   60;
    localparam STATE_RUN_N_ECHO         =   61;
    localparam STATE_RUN_PRINT_HEAD     =   62;
    localparam STATE_RUN_WAIT           =   63;
    localparam STATE_RUN_UART_INIT      =   64;
    localparam STATE_RUN_UART_DATA      =   65;
    localparam STATE_RUN_REACH_BP       =   66;
    localparam STATE_RUN_BP_INFO        =   67;

    localparam STATE_HALT_INIT          =   70;
    // localparam STATE

    localparam STATE_CMD_NOT_FOUND      =   255;

    // FLAGS
    localparam ECHO_ENABLE              =   1;
    localparam ECHO_DISABLE             =   0;

    localparam ACCESS_IM                =   0;
    localparam ACCESS_DM                =   1;
    localparam ACCESS_RF                =   2;

    localparam BRIDGE_CPU               =   0;
    localparam BRIDGE_PDU               =   1;


    // -----------------------------------------------------------------------------------------------------------------------
    // Used wires & registers
    // FSM
    reg     [ 7 : 0]    pdu_ctrl_cs         ;
    reg     [ 7 : 0]    pdu_ctrl_ns         ;
    reg     [ 7 : 0]    pdu_ctrl_ls         ;
    reg     [15 : 0]    fsm_counter         ; 

    // Information saving registers
    reg     [31 : 0]    local_base_addr     ;
    reg     [31 : 0]    local_length        ;
    reg     [31 : 0]    local_target_addr   ;
    reg     [31 : 0]    cur_access_addr     ;
    reg     [ 7 : 0]    enter_counter       ;
    reg     [31 : 0]    local_decode_data   ;
    reg     [ 7 : 0]    local_cpu_uart_data ;

    // Flags
    reg     [ 1 : 0]    access_flag         ;
    reg     [ 0 : 0]    uart_echo_flag      ;
    reg     [ 0 : 0]    should_add          ;

    // DECODE
    wire    [ 0 : 0]    decode_rx_data_valid;
    wire    [ 7 : 0]    decode_rx_data      ;
    wire    [31 : 0]    decode_base_addr    ;
    wire    [31 : 0]    decode_len          ;
    wire    [31 : 0]    decode_data         ;
    wire    [ 0 : 0]    decode_data_valid   ;
    wire    [ 0 : 0]    decode_data_end     ;
    wire    [ 0 : 0]    imem_read           ;
    wire    [ 0 : 0]    dmem_read           ;
    wire    [ 0 : 0]    reg_read            ;
    wire    [ 0 : 0]    imem_write          ;
    wire    [ 0 : 0]    dmem_write          ;
    wire    [ 0 : 0]    bp_set              ;
    wire    [ 0 : 0]    bp_list             ;
    wire    [ 0 : 0]    bp_clear            ;
    wire    [ 0 : 0]    cpu_step            ;
    wire    [ 0 : 0]    cpu_run             ;
    wire    [ 0 : 0]    cpu_halt            ;
    wire    [ 0 : 0]    decode_cmd_not_found;

    // MEMORY data 2 TX
    reg     [31 : 0]    mem_tx_data_raw         ;
    reg     [ 0 : 0]    mem_tx_data_raw_valid   ;
    wire    [ 0 : 0]    mem_tx_data_raw_accept  ;
    wire    [ 7 : 0]    mem_tx_data             ;
    wire    [ 0 : 0]    mem_tx_data_valid       ;

    // Breakpoint
    reg     [31 : 0]    bp_addr             ;
    reg     [ 0 : 0]    bp_we               ;
    wire    [31 : 0]    bp_0                ;
    wire    [31 : 0]    bp_1                ;
    wire    [31 : 0]    bp_2                ;
    wire    [ 2 : 0]    bp_valid            ;
    reg     [ 3 : 0]    cur_bp_index        ;
    reg     [ 0 : 0]    reach_bp            ;

    // Info sender
    reg     [63 : 0]    print_data          ;
    wire    [ 7 : 0]    info_tx_data        ;
    wire    [ 0 : 0]    info_tx_data_valid  ;
    wire    [ 0 : 0]    info_tx_data_accept ;
    wire    [ 0 : 0]    print_done          ;
    reg     [ 0 : 0]    print_logo          ;
    reg     [ 0 : 0]    print_line_head     ;
    reg     [ 0 : 0]    print_enter         ;
    reg     [ 0 : 0]    print_blank         ;
    reg     [ 0 : 0]    print_double_enter  ;
    reg     [ 0 : 0]    print_bp_valid      ;
    reg     [ 0 : 0]    print_bp_invalid    ;
    reg     [ 0 : 0]    print_bp_clear      ;
    reg     [ 0 : 0]    print_cur_pc        ;
    reg     [ 0 : 0]    print_cpu_head      ;
    // reg     [ 0 : 0]    print_cpu_reach_bp  ;
    reg     [ 0 : 0]    print_cmd_not_found ;

    // UART TX
    wire    [ 0 : 0]    pdu_uart_txd        ;
    wire    [ 0 : 0]    tx_enqueue          ;
    wire    [ 0 : 0]    tx_dequeue          ;
    wire    [ 7 : 0]    tx_enqueue_data     ;
    wire    [ 7 : 0]    tx_queue_head       ;
    wire    [ 0 : 0]    tx_queue_empty      ;
    wire    [ 0 : 0]    tx_queue_full       ;
    wire    [ 0 : 0]    tx_dequeue_raw      ;

    // UART RX
    reg     [31 : 0]    rx_dq_counter       ;
    wire    [ 0 : 0]    rx_enqueue          ;
    wire    [ 0 : 0]    rx_dequeue          ;
    wire    [ 7 : 0]    rx_enqueue_data     ;
    wire    [ 7 : 0]    rx_queue_head       ;
    wire    [ 0 : 0]    rx_queue_empty      ;
    wire    [ 0 : 0]    rx_queue_full       ;
    wire    [ 0 : 0]    rx_enqueue_raw      ;



    // -----------------------------------------------------------------------------------------------------------------------

    always @(posedge clk) begin
        if (rst)
            pdu_ctrl_cs <= STATE_RESET;
        else
            pdu_ctrl_cs <= pdu_ctrl_ns;
    end

    always @(posedge clk) begin
        if (rst)
            pdu_ctrl_ls <= STATE_RESET;
        else
            pdu_ctrl_ls <= pdu_ctrl_cs;
    end

    always @(*) begin
        pdu_ctrl_ns = pdu_ctrl_cs;

        case (pdu_ctrl_cs)

            STATE_RESET:
                pdu_ctrl_ns = STATE_SEND_LOGO;

            STATE_SEND_LOGO:
                if (print_done)
                    pdu_ctrl_ns = STATE_SEND_LINE_HEAD;

            STATE_SEND_LINE_HEAD:
                if (print_done)
                    pdu_ctrl_ns = STATE_ECHO_WAIT_QUEUE;

            STATE_ECHO_WAIT_QUEUE:
                if (tx_queue_empty)
                    pdu_ctrl_ns = STATE_ECHO_WAIT_CHAR;

            STATE_ECHO_WAIT_CHAR:
                if (fsm_counter[14])
                    pdu_ctrl_ns = STATE_ECHO;

            STATE_ECHO:
                pdu_ctrl_ns = STATE_WAIT;

            STATE_N_ECHO:
                pdu_ctrl_ns = STATE_SEND_ENTER;

            STATE_SEND_ENTER:
                if (print_done)
                    pdu_ctrl_ns = STATE_SEND_LINE_HEAD;

            // Core state
            STATE_WAIT: begin
                if (imem_read)
                    pdu_ctrl_ns = STATE_RI_INIT;
                else if (dmem_read)
                    pdu_ctrl_ns = STATE_RD_INIT;
                else if (reg_read)
                    pdu_ctrl_ns = STATE_RR_INIT;
                else if (imem_write)
                    pdu_ctrl_ns = STATE_WI_INIT;
                else if (dmem_write)
                    pdu_ctrl_ns = STATE_WD_INIT;
                else if (bp_clear)
                    pdu_ctrl_ns = STATE_BC_ENTER;
                else if (bp_set)
                    pdu_ctrl_ns = STATE_BS_ENTER;
                else if (bp_list)
                    pdu_ctrl_ns = STATE_BL_ENTER;
                else if (cpu_step)
                    pdu_ctrl_ns = STATE_STEP_INIT;
                else if (cpu_run)
                    pdu_ctrl_ns = STATE_RUN_INIT;
                else if (decode_cmd_not_found)
                    pdu_ctrl_ns = STATE_CMD_NOT_FOUND;
            end
               
            STATE_RI_INIT, STATE_RD_INIT, STATE_RR_INIT:
                pdu_ctrl_ns = STATE_R_SEND_ENTER;
            

            STATE_WI_INIT, STATE_WD_INIT:
                pdu_ctrl_ns = STATE_W_WAIT;


            // Read
            STATE_R_SEND_ENTER:
                if (print_done)
                    pdu_ctrl_ns = STATE_R_ADDR_CHECK;

            STATE_R_ADDR_CHECK:
                if (cur_access_addr > local_target_addr)
                    pdu_ctrl_ns = STATE_R_DONE;
                else
                    pdu_ctrl_ns = STATE_R_READ_M;

            STATE_R_DONE:
                pdu_ctrl_ns = STATE_N_ECHO;
                    
            STATE_R_READ_M:
                pdu_ctrl_ns = STATE_R_WAIT_M;

            STATE_R_WAIT_M:
                if (imem_pdu_rdata_valid || dmem_pdu_rdata_valid || access_flag == ACCESS_RF)
                    pdu_ctrl_ns = STATE_R_SEND_TX;

            STATE_R_SEND_TX:
                pdu_ctrl_ns = STATE_R_WAIT_TX;
            
            STATE_R_WAIT_TX:
                if (mem_tx_data_raw_accept) begin
                    if (~|enter_counter[1 : 0])
                        pdu_ctrl_ns = STATE_R_SEND_ENTER;
                    else
                        pdu_ctrl_ns = STATE_R_BLANK;
                end

            STATE_R_BLANK:
                if (print_done)
                    pdu_ctrl_ns = STATE_R_ADDR_CHECK;

            // Write
            STATE_W_WAIT:
                if (decode_data_end)
                    pdu_ctrl_ns = STATE_W_ZERO_1;
                else if (decode_data_valid)
                    pdu_ctrl_ns = STATE_W_DATA;
            
            STATE_W_DATA:
                pdu_ctrl_ns = STATE_W_WAIT;        
    
            STATE_W_ZERO_1:
                pdu_ctrl_ns = STATE_W_ADDR_CHECK;

            STATE_W_ADDR_CHECK:
                if (cur_access_addr > local_target_addr)    
                    pdu_ctrl_ns = STATE_W_DONE;
                else
                    pdu_ctrl_ns = STATE_W_ZERO_2;

            STATE_W_DONE:
                pdu_ctrl_ns = STATE_N_ECHO;        
    
            STATE_W_ZERO_2:
                pdu_ctrl_ns = STATE_W_ADDR_CHECK;
            

            // Breakpoint
            STATE_BL_ENTER:
                if (print_done)
                    pdu_ctrl_ns = STATE_BL_SEND_0;

            STATE_BL_SEND_0:
                if (print_done)
                    pdu_ctrl_ns = STATE_BL_SEND_1;
            
            STATE_BL_SEND_1:
                if (print_done)
                    pdu_ctrl_ns = STATE_BL_SEND_2;

            STATE_BL_SEND_2:
                if (print_done)
                    pdu_ctrl_ns = STATE_B_DONE;

            STATE_BS_ENTER:
                if (print_done)
                    pdu_ctrl_ns = STATE_BS_WAIT;

            STATE_BS_WAIT:
                if (decode_data_end)
                    pdu_ctrl_ns = STATE_BS_DONE;
                else if (decode_data_valid)
                    pdu_ctrl_ns = STATE_BS_SEND_INFO;

            STATE_BS_SEND_INFO:
                pdu_ctrl_ns = STATE_BS_WAIT;

            STATE_BS_DONE:
                pdu_ctrl_ns = STATE_B_DONE;

            STATE_BC_ENTER:
                if (print_done)
                    pdu_ctrl_ns = STATE_BC_SEND_INFO;
                
            STATE_BC_SEND_INFO:
                if (print_done)
                    pdu_ctrl_ns = STATE_B_DONE;

            STATE_B_DONE:
                pdu_ctrl_ns = STATE_N_ECHO;

            // CPU STEP
            STATE_STEP_INIT:
                pdu_ctrl_ns = STATE_STEP_ENABLE;

            STATE_STEP_ENABLE:
                if (cpu_commit_en)
                    pdu_ctrl_ns = STATE_STEP_ENTER;

            STATE_STEP_ENTER:
                if (print_done)
                    pdu_ctrl_ns = STATE_STEP_INFO;

            STATE_STEP_INFO:
                if (print_done)
                    pdu_ctrl_ns = STATE_STEP_DONE;

            STATE_STEP_DONE:
                pdu_ctrl_ns = STATE_N_ECHO;

            // CPU HALT
            STATE_RUN_INIT:
                pdu_ctrl_ns = STATE_RUN_N_ECHO;

            STATE_RUN_N_ECHO:
                pdu_ctrl_ns = STATE_RUN_PRINT_HEAD;

            STATE_RUN_PRINT_HEAD:
                if (print_done)
                    pdu_ctrl_ns = STATE_RUN_WAIT;

            STATE_RUN_WAIT:
                if (cpu_halt)
                    pdu_ctrl_ns = STATE_HALT_INIT;
                else if (cpu_commit_en) begin
                    if (cpu_commit_halt)
                        pdu_ctrl_ns = STATE_HALT_INIT;
                    else if (cpu_commit_pc >= bp_0 - 4 && bp_valid[0])
                        pdu_ctrl_ns = STATE_RUN_REACH_BP;
                    else if (mmio_pdu_data_valid)
                        pdu_ctrl_ns = STATE_RUN_UART_INIT;
                end


            STATE_RUN_REACH_BP:
                pdu_ctrl_ns = STATE_RUN_BP_INFO;

            STATE_RUN_BP_INFO:
                if (print_done)
                    pdu_ctrl_ns = STATE_N_ECHO;

            STATE_RUN_UART_INIT:
                pdu_ctrl_ns = STATE_RUN_UART_DATA;

            STATE_RUN_UART_DATA:
                pdu_ctrl_ns = STATE_RUN_WAIT;

            // HALT
            STATE_HALT_INIT:
                pdu_ctrl_ns = STATE_N_ECHO;

            STATE_CMD_NOT_FOUND:
                if (print_done)
                    pdu_ctrl_ns = STATE_N_ECHO;

            default:
                pdu_ctrl_ns = pdu_ctrl_cs;
        endcase
    end

    // Control signals
    wire    is_fsm_bp0  =   (pdu_ctrl_cs == STATE_BL_SEND_0) && (pdu_ctrl_ls != STATE_BL_SEND_0);
    wire    is_fsm_bp1  =   (pdu_ctrl_cs == STATE_BL_SEND_1) && (pdu_ctrl_ls != STATE_BL_SEND_1);
    wire    is_fsm_bp2  =   (pdu_ctrl_cs == STATE_BL_SEND_2) && (pdu_ctrl_ls != STATE_BL_SEND_2);
    wire    is_fsm_bpc  =   (pdu_ctrl_cs == STATE_BC_SEND_INFO) && (pdu_ctrl_ls != STATE_BC_SEND_INFO);

    always @(*) begin
        print_logo          =   (pdu_ctrl_cs == STATE_SEND_LOGO)      ;
        print_line_head     =   (pdu_ctrl_cs == STATE_SEND_LINE_HEAD) ;
        print_blank         =   (pdu_ctrl_cs == STATE_R_BLANK)        ;
        print_enter         =   (pdu_ctrl_cs == STATE_R_SEND_ENTER)
                            ||  (pdu_ctrl_cs == STATE_BL_ENTER)   
                            ||  (pdu_ctrl_cs == STATE_BS_ENTER)
                            ||  (pdu_ctrl_cs == STATE_BC_ENTER)
                            ||  (pdu_ctrl_cs == STATE_STEP_ENTER);

        print_double_enter  =   (pdu_ctrl_cs == STATE_SEND_ENTER)     ;

        print_bp_valid      =   (is_fsm_bp0 && bp_valid[0])
                            ||  (is_fsm_bp1 && bp_valid[1])
                            ||  (is_fsm_bp2 && bp_valid[2]);
        print_bp_invalid    =   (is_fsm_bp0 && ~bp_valid[0])
                            ||  (is_fsm_bp1 && ~bp_valid[1])
                            ||  (is_fsm_bp2 && ~bp_valid[2]);
        print_bp_clear      =   is_fsm_bpc;
        print_cur_pc        =   (pdu_ctrl_cs == STATE_STEP_INFO || pdu_ctrl_cs == STATE_RUN_BP_INFO);
        print_cpu_head      =   (pdu_ctrl_cs == STATE_RUN_PRINT_HEAD);
        print_cmd_not_found =   (pdu_ctrl_cs == STATE_CMD_NOT_FOUND);
    end

    
    // Flag signals
    always @(posedge clk) begin
        if (rst)
            uart_echo_flag <= ECHO_DISABLE;
        else if (pdu_ctrl_cs == STATE_ECHO)
            uart_echo_flag <= ECHO_ENABLE;
        else if (pdu_ctrl_cs == STATE_N_ECHO || pdu_ctrl_cs == STATE_RUN_N_ECHO)
            uart_echo_flag <= ECHO_DISABLE;
    end

    always @(posedge clk) begin
        if (rst)
            access_flag <= ACCESS_IM;
        else if (pdu_ctrl_cs == STATE_RI_INIT || pdu_ctrl_cs == STATE_WI_INIT)
            access_flag <= ACCESS_IM;
        else if (pdu_ctrl_cs == STATE_RD_INIT || pdu_ctrl_cs == STATE_WD_INIT)
            access_flag <= ACCESS_DM;
        else if (pdu_ctrl_cs == STATE_RR_INIT)
            access_flag <= ACCESS_RF;
    end


    // Important signals
    always @(*) begin
        if (access_flag == ACCESS_RF)
            local_target_addr = local_base_addr + local_length - 1;
        else
            local_target_addr = local_base_addr + local_length * 4 - 4;
    end
        

    always @(posedge clk) begin
        if (rst) begin
            local_base_addr <= 0;
            local_length <= 0;
        end
        else if (pdu_ctrl_cs == STATE_WAIT && (imem_read | dmem_read | imem_write | dmem_write | reg_read)) begin
            local_base_addr <= decode_base_addr ;
            local_length    <= decode_len;
        end
    end

    always @(posedge clk) begin
        if (rst)
            local_decode_data <= 0;
        else if (decode_data_valid)
            local_decode_data <= decode_data;
        else if (pdu_ctrl_cs == STATE_WAIT || pdu_ctrl_cs == STATE_W_ZERO_1)
            local_decode_data <= 0;
    end

    always @(posedge clk) begin
        if (rst)
            local_cpu_uart_data <= 0;
        else if (mmio_pdu_data_valid)
            local_cpu_uart_data <= mmio_pdu_data;
    end

    always @(posedge clk) begin
        if (rst)
            fsm_counter <= 0;
        else if (pdu_ctrl_cs == STATE_ECHO_WAIT_CHAR) begin
            if (fsm_counter[14])
                fsm_counter <= 0;
            else
                fsm_counter <= fsm_counter + 1;
        end
        else
            fsm_counter <= 0;
    end

    always @(posedge clk) begin
        if (rst)
            should_add <= 0;
        else if (   pdu_ctrl_cs == STATE_R_SEND_TX  || pdu_ctrl_ns == STATE_W_DATA 
                ||  pdu_ctrl_ns == STATE_W_ZERO_1   || pdu_ctrl_ns == STATE_W_ZERO_2)
            should_add <= 1;
        else
            should_add <= 0;
    end

    always @(posedge clk) begin
        if (rst)
            cur_access_addr  <= 0;
        else if (pdu_ctrl_cs == STATE_WAIT)
            cur_access_addr  <= 0;
        else if (   pdu_ctrl_cs == STATE_RI_INIT || pdu_ctrl_cs == STATE_RD_INIT || pdu_ctrl_cs == STATE_RR_INIT
                ||  pdu_ctrl_cs == STATE_WI_INIT || pdu_ctrl_cs == STATE_WD_INIT)
            cur_access_addr  <= local_base_addr; 
        else if (should_add) begin
            if (access_flag == ACCESS_RF)
                cur_access_addr  <= cur_access_addr  + 32'H1;
            else
                cur_access_addr  <= cur_access_addr  + 32'H4;
        end
            
    end

    always @(posedge clk) begin
        if (rst)
            enter_counter <= 0;
        else if (pdu_ctrl_cs == STATE_RI_INIT || pdu_ctrl_cs == STATE_RD_INIT || pdu_ctrl_cs == STATE_RR_INIT)
            enter_counter <= 0;
        else if (should_add)
            enter_counter <= enter_counter + 1;
    end

    always @(*) begin
        is_pdu = (pdu_ctrl_ns == STATE_STEP_ENABLE || pdu_ctrl_ns == STATE_RUN_WAIT) ? BRIDGE_CPU : BRIDGE_PDU;
    end

    // MEMORY WIRES -------------------------------------------------------------------------

    always @(*) begin
        pdu_imem_addr       = cur_access_addr;
        pdu_imem_re         = (pdu_ctrl_cs == STATE_R_READ_M) && (access_flag == ACCESS_IM);
        pdu_imem_we         = (pdu_ctrl_cs == STATE_W_DATA || pdu_ctrl_cs == STATE_W_ZERO_1 || pdu_ctrl_cs == STATE_W_ZERO_2)
                            && (access_flag == ACCESS_IM);
        pdu_imem_wdata      = local_decode_data;
    end

    always @(*) begin
        pdu_dmem_addr       = cur_access_addr;
        pdu_dmem_re         = (pdu_ctrl_cs == STATE_R_READ_M) && (access_flag == ACCESS_DM);
        pdu_dmem_we         = (pdu_ctrl_cs == STATE_W_DATA || pdu_ctrl_cs == STATE_W_ZERO_1 || pdu_ctrl_cs == STATE_W_ZERO_2)
                            && (access_flag == ACCESS_DM);
        pdu_dmem_wdata      = local_decode_data;
    end

    always @(*) begin
        pdu_rf_addr         = cur_access_addr[4:0];
    end

    // BREAKPOINT ----------------------------------------------------------------------------
    always @(*) begin
        print_data = 0;
        
        case (pdu_ctrl_cs)
            STATE_BL_SEND_0:        print_data = {4'D0, 28'B0, bp_0};
            STATE_BL_SEND_1:        print_data = {4'D1, 28'B0, bp_1};
            STATE_BL_SEND_2:        print_data = {4'D2, 28'B0, bp_2};
            STATE_BS_SEND_INFO:     print_data = {cur_bp_index, 28'B0, bp_addr};
            STATE_STEP_INFO:        print_data = {32'B0, cpu_commit_pc};
            STATE_RUN_BP_INFO:      print_data = {32'B0, cpu_commit_pc};
        endcase
    end


    always @(*) begin
        cur_bp_index = ~bp_valid[0] ? 4'D0 
                                    : ~bp_valid[1] ? 4'D1
                                                   : ~bp_valid[2] ? 4'D2 : 4'HF;  

        bp_we       =       (pdu_ctrl_cs == STATE_BS_SEND_INFO && pdu_ctrl_ls != STATE_BS_SEND_INFO)
                        ||  (pdu_ctrl_cs == STATE_BS_DONE && pdu_ctrl_ls != STATE_BS_DONE);
        bp_addr     = local_decode_data;
        reach_bp    =   (pdu_ctrl_cs == STATE_RUN_REACH_BP);
    end


    // STEP & RUN -------------------------------------------------------------------------------
    always @(*) begin
        cpu_global_en = (pdu_ctrl_ns == STATE_STEP_ENABLE || pdu_ctrl_ns == STATE_RUN_WAIT);
    end


    // Modules -------------------------------------------------------------------------------

    PDU_DECODE pdu_decode (
        .clk                (clk                    ),
        .rst                (rst                    ),
        .rx_data_valid      (decode_rx_data_valid   ),
        .rx_data            (decode_rx_data         ),
        .imem_read          (imem_read              ),
        .dmem_read          (dmem_read              ),
        .reg_read           (reg_read               ),
        .imem_write         (imem_write             ),
        .dmem_write         (dmem_write             ),
        .base_addr          (decode_base_addr       ),
        .length             (decode_len             ),

        .bp_set             (bp_set                 ),
        .bp_list            (bp_list                ),
        .bp_clear           (bp_clear               ),

        .cpu_step           (cpu_step               ),
        .cpu_run            (cpu_run                ),
        .cpu_halt           (cpu_halt               ),

        .command_not_found  (decode_cmd_not_found   ),

        .decode_data        (decode_data            ),
        .decode_data_valid  (decode_data_valid      ),
        .decode_data_end    (decode_data_end        )
    );
    
    HEX2UART hex2uart(
        .clk                (clk                    ),
        .rst                (rst                    ),
        .hex_data           (mem_tx_data_raw        ),
        .hex_data_valid     (mem_tx_data_raw_valid  ),  
        .hex_data_accept    (mem_tx_data_raw_accept ),
        .tx_data            (mem_tx_data            ),
        .tx_data_valid      (mem_tx_data_valid      )
    ); 
      
    always @(*) begin
        mem_tx_data_raw_valid = (pdu_ctrl_cs == STATE_R_SEND_TX);
    end

    always @(*) begin
        mem_tx_data_raw = 0;
        case (access_flag)
            ACCESS_IM: mem_tx_data_raw = imem_pdu_rdata;
            ACCESS_DM: mem_tx_data_raw = dmem_pdu_rdata;
            ACCESS_RF: mem_tx_data_raw = rf_pdu_data;
        endcase
    end
      
    // Breakpoints
    BP_LIST_REG bp_reg (
        .clk         (clk       ),
        .rst         (rst       ),
        .bp_addr     (bp_addr   ),
        .bp_we       (bp_we     ),
        .bp_clear    (bp_clear  ),
        .reach_bp    (reach_bp  ),
        .bp_0        (bp_0      ),
        .bp_1        (bp_1      ),
        .bp_2        (bp_2      ),
        .bp_valid    (bp_valid  )   
    );
      
      
    // UART PART ----------------------------------------------------------------------------------------

    INFO_SENDER info_sender (
        .clk                (clk                )   ,
        .rst                (rst                )   ,
        .tx_data            (info_tx_data       )   ,
        .tx_data_valid      (info_tx_data_valid )   ,
        .tx_data_accept     (1'B1               )   ,

        .print_logo         (print_logo         )   ,
        .print_line_head    (print_line_head    )   ,
        .print_enter        (print_enter        )   ,
        .print_blank        (print_blank        )   ,
        .print_double_enter (print_double_enter )   ,

        .print_data         (print_data         )   ,
        .print_bp_valid     (print_bp_valid     )   ,
        .print_bp_invalid   (print_bp_invalid   )   ,
        .print_bp_set       (1'B0               )   ,   // Unused now, will finish later!
        .print_bp_clear     (print_bp_clear     )   ,

        .print_cur_pc       (print_cur_pc       )   ,
        .print_cpu_head     (print_cpu_head     )   ,

        .print_cmd_not_found(print_cmd_not_found)   ,

        .print_done         (print_done         )   
    );

    
    // UART TX
    UART_TX uart_tx (
        .clk                (clk            )   ,
        .rst                (rst            )   ,
        .en                 (1'B1           )   ,
        .data               (tx_queue_head  )   ,
        .ready              (!tx_queue_empty)   ,
        .transmitted        (tx_dequeue_raw )   ,
        .uart_txd           (pdu_uart_txd   )   
    );

    QUEUE #(.DEPTH(8)) tx_queue (
        .clk                (clk            )   ,
        .rst                (rst            )   ,
        .en                 (1'B1           )   ,
        .enqueue            (tx_enqueue     )   ,
        .dequeue            (tx_dequeue & uart_echo_flag == ECHO_DISABLE)   ,
        .enqueue_data       (tx_enqueue_data)   ,
        .queue_head_data    (tx_queue_head  )   ,
        .empty              (tx_queue_empty )   ,
        .full               (tx_queue_full  )   
    );

    POSEDGE_GEN tx_enqueue_gen (
        .clk                (clk            )   ,
        .signal             (tx_dequeue_raw )   ,
        .signal_posedge     (tx_dequeue     )
    );

    wire mmio_pdu_uart_data_valid = (pdu_ctrl_cs == STATE_RUN_UART_DATA);
    wire [7 : 0]    mmio_pdu_uart_data = local_cpu_uart_data;

    assign  tx_enqueue      = info_tx_data_valid    | mem_tx_data_valid  | mmio_pdu_uart_data_valid;
    assign  tx_enqueue_data = info_tx_data_valid ? info_tx_data 
                                                 : mmio_pdu_uart_data_valid ? mmio_pdu_uart_data
                                                                            : mem_tx_data;
    // assign  tx_enqueue_data = info_tx_data          | mem_tx_data        ;
   


    // UART RX
    UART_RX uart_rx (
        .clk                (clk                ),
        .rst                (rst                ),
        .en                 (1'B1               ),
        .uart_rxd           (uart_rxd           ),
        .ready              (rx_enqueue_raw     ),
        .data               (rx_enqueue_data    )
    );

    QUEUE #(.DEPTH(8)) rx_queue (
        .clk                (clk                ),
        .rst                (rst                ),
        .en                 (1'B1               ),
        .enqueue            (rx_enqueue         ),
        .dequeue            (rx_dequeue         ),
        .enqueue_data       (rx_enqueue_data    ),
        .queue_head_data    (rx_queue_head      ),
        .empty              (rx_queue_empty     ),
        .full               (rx_queue_full      )
    );

    POSEDGE_GEN rx_enqueue_gen (
        .clk                (clk                ),
        .signal             (rx_enqueue_raw     ),
        .signal_posedge     (rx_enqueue         )
    );

    always @(posedge clk) begin
        if (rst)
            rx_dq_counter <= 0;
        else if (rx_dq_counter != 0)
            rx_dq_counter <= rx_dq_counter - 1;
        else if (~rx_queue_empty)
                rx_dq_counter <= 15;
    end

    assign decode_rx_data_valid     = (rx_dq_counter == 10);
    assign decode_rx_data           = rx_queue_head;
    assign rx_dequeue               = (rx_dq_counter == 3);


    // UART ECHO
    always @(*) begin
        if (uart_echo_flag == ECHO_ENABLE)
            uart_txd = uart_rxd;
        else
            uart_txd = pdu_uart_txd;
    end


    // DEBUG
    always @(*)
        dbg_data = cpu_commit_inst;
endmodule