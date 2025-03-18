module MMIO (
    input                   [ 0 : 0]            clk                     ,
    input                   [ 0 : 0]            rst                     ,    

    // CPU
    input                   [31 : 0]            cpu_dmem_addr           ,       
    output          reg     [31 : 0]            cpu_dmem_rdata          ,
    input                   [ 0 : 0]            cpu_dmem_we             ,
    input                   [31 : 0]            cpu_dmem_wdata          ,

    // PDU
    input                   [ 0 : 0]            pdu_uart_data_ready     ,
    input                   [ 7 : 0]            pdu_uart_data           ,
    output          reg     [ 0 : 0]            pdu_uart_data_accept    ,

    output          reg     [ 0 : 0]            cpu_uart_data_valid     ,
    output                  [ 7 : 0]            cpu_uart_data           ,


    // LED
    output                  [ 7 : 0]            led
);

    // FSM
    localparam WAIT                     =   0;
    localparam CPU_UART_VALID           =   1;
    localparam CPU_UART_SEND_DATA       =   2;
    localparam CPU_UART_CLEAR_VALID     =   3;

    localparam PDU_UART_READY           =   5;
    localparam PDU_UART_WAIT            =   6;
    localparam PDU_UART_DATA_READ       =   7;

    
    // ADDRESS
    localparam  ADDR_CPU_UART_VALID  = 32'HFFFF0000;     // CPU R&W, PDU R&W
    localparam  ADDR_CPU_UART_DATA   = 32'HFFFF0004;     // CPU R&W, PDU R
    localparam  ADDR_CPU_LED         = 32'HFFFF0008;     // CPU R&W
    localparam  ADDR_PDU_UART_READY  = 32'HFFFF000C;     // CPU R&W, PDU R&W
    localparam  ADDR_PDU_UART_DATA   = 32'HFFFF0010;     // CPU R, PDU R&W


    reg [31 : 0]    cpu_uart_valid_reg      ;       // 0xFFFF0000
    reg [31 : 0]    cpu_uart_data_reg       ;       // 0xFFFF0004
    reg [31 : 0]    cpu_led_reg             ;       // 0xFFFF0008
    reg [31 : 0]    pdu_uart_ready_reg      ;       // 0xFFFF000C
    reg [31 : 0]    pdu_uart_data_reg       ;       // 0xFFFF0010



    reg [4 : 0] mmio_cs, mmio_ns;
    always @(posedge clk) begin
        if (rst)
            mmio_cs <= WAIT;
        else
            mmio_cs <= mmio_ns;
    end

    always @(*) begin
        mmio_ns = mmio_cs;

        case (mmio_cs)
            WAIT:
                if (|cpu_uart_valid_reg)
                    mmio_ns = CPU_UART_VALID;
                else if (pdu_uart_data_ready)
                    mmio_ns = PDU_UART_READY;

            CPU_UART_VALID:
                mmio_ns = CPU_UART_SEND_DATA;

            CPU_UART_SEND_DATA:
                mmio_ns = CPU_UART_CLEAR_VALID;

            CPU_UART_CLEAR_VALID:
                mmio_ns = WAIT;

            PDU_UART_READY:
                mmio_ns = PDU_UART_WAIT;

            PDU_UART_WAIT:
                if (pdu_uart_data_ready == 0)
                    mmio_ns = PDU_UART_DATA_READ;
                
            PDU_UART_DATA_READ:
                mmio_ns = WAIT;
            
        endcase
    end


    assign cpu_uart_data = cpu_uart_data_reg[7:0];
    always @(*) begin
        cpu_uart_data_valid     = (mmio_cs == CPU_UART_SEND_DATA);
        pdu_uart_data_accept    = (mmio_cs == PDU_UART_DATA_READ);
    end
    assign led = cpu_led_reg[7:0];


    always @(*) begin
        case (cpu_dmem_addr)
            ADDR_CPU_UART_VALID: cpu_dmem_rdata = cpu_uart_valid_reg ;
            ADDR_CPU_UART_DATA:  cpu_dmem_rdata = cpu_uart_data_reg  ;
            ADDR_CPU_LED:        cpu_dmem_rdata = cpu_led_reg        ;        
            ADDR_PDU_UART_READY: cpu_dmem_rdata = pdu_uart_ready_reg ;
            ADDR_PDU_UART_DATA:  cpu_dmem_rdata = pdu_uart_data_reg  ;
            default:        cpu_dmem_rdata = 0;    
        endcase
    end

    always @(posedge clk) begin
        if (rst)
            cpu_uart_valid_reg <= 0;
        else if (mmio_ns == CPU_UART_CLEAR_VALID)
            cpu_uart_valid_reg <= 0;
        else if (cpu_dmem_we && cpu_dmem_addr == ADDR_CPU_UART_VALID)
            cpu_uart_valid_reg <= cpu_dmem_wdata;
        
    end

    always @(posedge clk) begin
        if (rst)
            cpu_uart_data_reg <= 0;
        else if (cpu_dmem_we && cpu_dmem_addr == ADDR_CPU_UART_DATA)
            cpu_uart_data_reg <= cpu_dmem_wdata;
    end

    always @(posedge clk) begin
        if (rst)
            cpu_led_reg <= 0;
        else if (cpu_dmem_we && cpu_dmem_addr == ADDR_CPU_LED)
            cpu_led_reg <= cpu_dmem_wdata;
    end

    always @(posedge clk) begin
        if (rst)
            pdu_uart_data_reg <= 0;
        else if (pdu_uart_data_ready)
            pdu_uart_data_reg <= {24'B0, pdu_uart_data};
    end

    always @(posedge clk) begin
        if (rst)
            pdu_uart_ready_reg <= 0;
        else if (cpu_dmem_we && cpu_dmem_addr == ADDR_PDU_UART_READY)
            pdu_uart_ready_reg <= cpu_dmem_wdata;
        else if (pdu_uart_data_ready)
            pdu_uart_ready_reg <= 1;

    end

endmodule