module MEM_BRIDGE (
    input                   [ 0 : 0]            clk                 ,
    input                   [ 0 : 0]            rst                 ,

    input                   [ 0 : 0]            is_pdu              ,

    // CPU
    input                   [31 : 0]            cpu_imem_raddr      ,
    output                  [31 : 0]            cpu_imem_rdata      ,
    input                   [31 : 0]            cpu_dmem_addr       ,
    output                  [31 : 0]            cpu_dmem_rdata      ,
    input                   [31 : 0]            cpu_dmem_wdata      ,
    input                   [ 0 : 0]            cpu_dmem_we         ,
    
    
    // UART
    input                   [31 : 0]            pdu_imem_addr       ,
    output                  [31 : 0]            pdu_imem_rdata      ,
    output                  [ 0 : 0]            pdu_imem_rdata_valid,
    input                   [ 0 : 0]            pdu_imem_re         ,       // Unused
    input                   [31 : 0]            pdu_imem_wdata      ,
    input                   [ 0 : 0]            pdu_imem_we         ,

    input                   [31 : 0]            pdu_dmem_addr       ,
    output                  [31 : 0]            pdu_dmem_rdata      ,
    output                  [ 0 : 0]            pdu_dmem_rdata_valid,
    input                   [ 0 : 0]            pdu_dmem_re         ,       // Unused
    input                   [31 : 0]            pdu_dmem_wdata      ,
    input                   [ 0 : 0]            pdu_dmem_we         ,
    

    // MEM
    output                  [31 : 0]            imem_addr           ,
    input                   [31 : 0]            imem_rdata          ,
    output                  [31 : 0]            imem_wdata          , 
    output                  [ 0 : 0]            imem_we             ,

    output                  [31 : 0]            dmem_addr           ,
    input                   [31 : 0]            dmem_rdata          ,
    output                  [31 : 0]            dmem_wdata          , 
    output                  [ 0 : 0]            dmem_we             
);


    reg     [31 : 0]            pdu_imem_addr_r       ;
    reg     [31 : 0]            pdu_imem_rdata_r        ;
    reg     [ 0 : 0]            pdu_imem_rdata_valid_r  ;
    reg     [ 0 : 0]            pdu_imem_re_r         ;       // Unused
    reg     [31 : 0]            pdu_imem_wdata_r      ;
    reg     [ 0 : 0]            pdu_imem_we_r         ;

    reg     [31 : 0]            pdu_dmem_addr_r       ;
    reg     [31 : 0]            pdu_dmem_rdata_r        ;
    reg     [ 0 : 0]            pdu_dmem_rdata_valid_r  ;
    reg     [ 0 : 0]            pdu_dmem_re_r         ;       // Unused
    reg     [31 : 0]            pdu_dmem_wdata_r      ;
    reg     [ 0 : 0]            pdu_dmem_we_r         ;

    always @(posedge clk) begin
        if (rst) begin
            pdu_imem_addr_r   <= 0;
            pdu_imem_re_r     <= 0;
            pdu_imem_rdata_r  <= 0;
            pdu_imem_rdata_valid_r <= 0;
            pdu_imem_wdata_r  <= 0;
            pdu_imem_we_r     <= 0;

            pdu_dmem_addr_r   <= 0;
            pdu_dmem_re_r     <= 0;
            pdu_dmem_rdata_r  <= 0;
            pdu_dmem_rdata_valid_r <= 0;
            pdu_dmem_wdata_r  <= 0;
            pdu_dmem_we_r     <= 0;
        end
        else begin
            pdu_imem_addr_r     <= pdu_imem_addr    ;    
            pdu_imem_re_r       <= pdu_imem_re      ;    
            pdu_imem_wdata_r    <= pdu_imem_wdata   ; 
            pdu_imem_rdata_r    <= is_pdu ? imem_rdata : 0;
            pdu_imem_rdata_valid_r <= pdu_imem_re_r;
            pdu_imem_we_r       <= pdu_imem_we      ;   

            pdu_dmem_addr_r     <= pdu_dmem_addr    ;   
            pdu_dmem_re_r       <= pdu_dmem_re      ;   
            pdu_dmem_wdata_r    <= pdu_dmem_wdata   ;  
            pdu_dmem_rdata_r    <= is_pdu ? dmem_rdata : 0;
            pdu_dmem_rdata_valid_r <= pdu_dmem_re_r;
            pdu_dmem_we_r       <= pdu_dmem_we      ;
        end
    end


    // IMEM
    assign imem_addr        = is_pdu ? pdu_imem_addr_r : cpu_imem_raddr;
    assign cpu_imem_rdata   = is_pdu ? 0 : imem_rdata;
    assign pdu_imem_rdata   = pdu_imem_rdata_r;
    assign pdu_imem_rdata_valid = pdu_imem_rdata_valid_r;
    assign imem_wdata       = pdu_imem_wdata_r; 
    assign imem_we          = pdu_imem_we_r;


    // DMEM control
    assign dmem_addr        = is_pdu ? pdu_dmem_addr_r : cpu_dmem_addr;
    assign cpu_dmem_rdata   = is_pdu ? 0 : dmem_rdata;
    assign pdu_dmem_rdata   = pdu_dmem_rdata_r;
    assign pdu_dmem_rdata_valid = pdu_dmem_rdata_valid_r;
    assign dmem_wdata       = is_pdu ? pdu_dmem_wdata_r : cpu_dmem_wdata; 
    assign dmem_we          = is_pdu ? pdu_dmem_we_r : cpu_dmem_we;

endmodule