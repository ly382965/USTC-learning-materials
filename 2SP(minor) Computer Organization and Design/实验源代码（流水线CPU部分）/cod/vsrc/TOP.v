module TOP (
    input                   [ 0 : 0]            clk             ,
    input                   [ 0 : 0]            rst             ,

    output                  [ 2 : 0]            seg_an          ,
    output                  [ 3 : 0]            seg_data        ,

    output                  [ 0 : 0]            uart_txd        ,
    input                   [ 0 : 0]            uart_rxd        ,

    output                  [ 7 : 0]            led   
);


    // Important signals
    // PDU
    wire [ 0 : 0]   is_pdu                  ;

    wire [31 : 0]   pdu_imem_addr           ;
    wire [31 : 0]   imem_pdu_rdata          ;
    wire [ 0 : 0]   imem_pdu_rdata_valid    ;
    wire [ 0 : 0]   pdu_imem_re             ;
    wire [31 : 0]   pdu_imem_wdata          ;
    wire [ 0 : 0]   pdu_imem_we             ;
    wire [31 : 0]   pdu_dmem_addr           ;
    wire [31 : 0]   dmem_pdu_rdata          ;
    wire [ 0 : 0]   dmem_pdu_rdata_valid    ;
    wire [ 0 : 0]   pdu_dmem_re             ;
    wire [31 : 0]   pdu_dmem_wdata          ;
    wire [ 0 : 0]   pdu_dmem_we             ;

    wire [ 0 : 0]   mmio_is_halt            ;
    wire [ 0 : 0]   mmio_pdu_data_valid     ;
    wire [31 : 0]   mmio_pdu_data           ;
    wire [ 0 : 0]   pdu_mmio_data_accept    ;
    wire [ 7 : 0]   pdu_mmio_data           ;
    wire [ 0 : 0]   pdu_mmio_data_ready     ;
    wire [ 4 : 0]   pdu_rf_addr             ;
    wire [31 : 0]   rf_pdu_data             ;

    // CPU
    wire [ 0 : 0]   cpu_global_en           ;

    wire [31 : 0]   cpu_imem_raddr          ;
    wire [31 : 0]   imem_cpu_rdata          ;
    wire [31 : 0]   dmem_cpu_rdata          ;

    wire [ 0 : 0]   cpu_dmem_we             ;
    wire [31 : 0]   cpu_dmem_addr           ;
    wire [31 : 0]   cpu_dmem_wdata          ;

    wire [ 0 : 0]   cpu_commit_en           ;
    wire [31 : 0]   cpu_commit_pc           ;
    wire [31 : 0]   cpu_commit_inst         ;
    wire [ 0 : 0]   cpu_commit_halt         ;

    // MEMORY
    wire [31 : 0]   imem_addr               ;
    wire [31 : 0]   imem_rdata              ;
    wire [31 : 0]   imem_wdata              ;
    wire [ 0 : 0]   imem_we                 ;
    wire [31 : 0]   dmem_addr               ;
    wire [31 : 0]   dmem_rdata              ;
    wire [31 : 0]   dmem_wdata              ;
    wire [ 0 : 0]   dmem_we                 ;


    // dbg
    wire [31 : 0]   dbg_data                ;

    // clk
    wire [ 0 : 0]   CLK_50MHZ               ;

// PLLE2_BASE: Base Phase Locked Loop (PLL)
//             7 Series
// Xilinx HDL Language Template, version 2023.2
    wire n_clk_fbout;
    PLLE2_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // OPTIMIZED, HIGH, LOW
        .CLKFBOUT_MULT(16),        // Multiply value for all CLKOUT, (2-64)
        .CLKFBOUT_PHASE(0.0),     // Phase offset in degrees of CLKFB, (-360.000-360.000).
        .CLKIN1_PERIOD(10),      // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
        .CLKOUT0_DIVIDE(32),
        .CLKOUT1_DIVIDE(1),
        .CLKOUT2_DIVIDE(1),
        .CLKOUT3_DIVIDE(1),
        .CLKOUT4_DIVIDE(1),
        .CLKOUT5_DIVIDE(1),
        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(0.0),
        .CLKOUT2_PHASE(0.0),
        .CLKOUT3_PHASE(0.0),
        .CLKOUT4_PHASE(0.0),
        .CLKOUT5_PHASE(0.0),
        .DIVCLK_DIVIDE(1),        // Master division value, (1-56)
        .REF_JITTER1(0.0),        // Reference input jitter in UI, (0.000-0.999).
        .STARTUP_WAIT("FALSE")    // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
    ) PLLE2_BASE_inst (
        // Clock Outputs: 1-bit (each) output: User configurable clock outputs
        .CLKOUT0(CLK_50MHZ ),   // 1-bit output: CLKOUT0
        .CLKOUT1(           ),   // 1-bit output: CLKOUT1
        .CLKOUT2(           ),   // 1-bit output: CLKOUT2
        .CLKOUT3(           ),   // 1-bit output: CLKOUT3
        .CLKOUT4(           ),   // 1-bit output: CLKOUT4
        .CLKOUT5(           ),   // 1-bit output: CLKOUT5
        // Feedback Clocks: 1-bit (each) output: Clock feedback ports
        .CLKFBOUT(n_clk_fbout), // 1-bit output: Feedback clock
        .LOCKED(),     // 1-bit output: LOCK
        .CLKIN1(clk),     // 1-bit input: Input clock
        // Control Ports: 1-bit (each) input: PLL control ports
        .PWRDWN(1'B0),     // 1-bit input: Power-down
        .RST(1'B0),           // 1-bit input: Reset
        // Feedback Clocks: 1-bit (each) input: Clock feedback ports
        .CLKFBIN(n_clk_fbout)    // 1-bit input: Feedback clock
    );

    PDU pdu (
        .clk                    (CLK_50MHZ              )   ,
        .rst                    (rst                    )   ,

        .is_pdu                 (is_pdu                 )   ,                          

        .pdu_imem_addr          (pdu_imem_addr          )   ,
        .imem_pdu_rdata         (imem_pdu_rdata         )   ,
        .imem_pdu_rdata_valid   (imem_pdu_rdata_valid   )   ,
        .pdu_imem_re            (pdu_imem_re            )   ,
        .pdu_imem_wdata         (pdu_imem_wdata         )   ,
        .pdu_imem_we            (pdu_imem_we            )   ,

        .pdu_dmem_addr          (pdu_dmem_addr          )   ,
        .dmem_pdu_rdata         (dmem_pdu_rdata         )   ,
        .dmem_pdu_rdata_valid   (dmem_pdu_rdata_valid   )   ,
        .pdu_dmem_re            (pdu_dmem_re            )   ,
        .pdu_dmem_wdata         (pdu_dmem_wdata         )   ,
        .pdu_dmem_we            (pdu_dmem_we            )   ,

        .cpu_commit_en          (cpu_commit_en          )   ,
        .cpu_commit_pc          (cpu_commit_pc          )   ,
        .cpu_commit_inst        (cpu_commit_inst        )   ,
        .cpu_commit_halt        (cpu_commit_halt        )   ,
        .cpu_global_en          (cpu_global_en          )   ,

        .mmio_is_halt           (1'B0                   )   ,
        .mmio_pdu_data_valid    (mmio_pdu_data_valid    )   ,
        .mmio_pdu_data          (mmio_pdu_data          )   ,
        .pdu_mmio_data          (pdu_mmio_data          )   ,
        .pdu_mmio_data_ready    (pdu_mmio_data_ready    )   ,
        .pdu_mmio_data_accept   (pdu_mmio_data_accept   )   ,

        .pdu_rf_addr            (pdu_rf_addr            )   ,
        .rf_pdu_data            (rf_pdu_data            )   ,

        .uart_txd               (uart_txd               )   ,
        .uart_rxd               (uart_rxd               )   

        // dbg
        , .dbg_data             (dbg_data               )
    );

    CPU cpu (
        .clk                    (CLK_50MHZ              )   ,
        .rst                    (rst                    )   ,
        .global_en              (cpu_global_en          )   ,

    // Memory (inst)
        .imem_raddr             (cpu_imem_raddr         )   ,
        .imem_rdata             (imem_cpu_rdata         )   ,

    // Memory (data)
        .dmem_rdata             (dmem_cpu_rdata         )   ,
        .dmem_we                (cpu_dmem_we            )   ,
        .dmem_addr              (cpu_dmem_addr          )   ,
        .dmem_wdata             (cpu_dmem_wdata         )   ,

    // Debug
        .commit                 (cpu_commit_en          )   ,
        .commit_pc              (cpu_commit_pc          )   ,
        .commit_inst            (cpu_commit_inst        )   ,
        .commit_halt            (cpu_commit_halt        )   ,
        .commit_reg_we          (                       )   ,
        .commit_reg_wa          (                       )   ,
        .commit_reg_wd          (                       )   ,
        .commit_dmem_we         (                       )   ,
        .commit_dmem_wa         (                       )   ,
        .commit_dmem_wd         (                       )   ,

        .debug_reg_ra           (pdu_rf_addr            )   ,
        .debug_reg_rd           (rf_pdu_data            )   
    );

    wire [31 : 0]   mmio_cpu_rdata;
    wire [31 : 0]   true_dmem_cpu_rdata;
    wire is_mmio = (cpu_dmem_addr >= 32'HFFFF0000);
    assign dmem_cpu_rdata = is_mmio ? mmio_cpu_rdata : true_dmem_cpu_rdata;

    MMIO mmio (
        .clk                     (CLK_50MHZ             ),
        .rst                     (rst                   ),   

        .cpu_dmem_addr           (cpu_dmem_addr         ),       
        .cpu_dmem_rdata          (mmio_cpu_rdata        ),
        .cpu_dmem_we             (cpu_dmem_we & is_mmio ),
        .cpu_dmem_wdata          (cpu_dmem_wdata        ),

        .pdu_uart_data_ready     (pdu_mmio_data_ready   ),
        .pdu_uart_data           (pdu_mmio_data         ),
        .pdu_uart_data_accept    (pdu_mmio_data_accept  ),

        .cpu_uart_data_valid     (mmio_pdu_data_valid   ),
        .cpu_uart_data           (mmio_pdu_data         ),

        .led                     (led                   )
    );


    MEM_BRIDGE mem_bridge (
        .clk                 (CLK_50MHZ                 ),
        .rst                 (rst                       ),
        .is_pdu              (is_pdu                    ),

        .cpu_imem_raddr      (cpu_imem_raddr            ),
        .cpu_imem_rdata      (imem_cpu_rdata            ),
        .cpu_dmem_addr       (cpu_dmem_addr             ),
        .cpu_dmem_rdata      (true_dmem_cpu_rdata       ),
        .cpu_dmem_wdata      (cpu_dmem_wdata            ),
        .cpu_dmem_we         (cpu_dmem_we & ~is_mmio    ),

        .pdu_imem_addr       (pdu_imem_addr             ),
        .pdu_imem_rdata      (imem_pdu_rdata            ),
        .pdu_imem_rdata_valid(imem_pdu_rdata_valid      ),
        .pdu_imem_re         (pdu_imem_re               ),       // Unused
        .pdu_imem_wdata      (pdu_imem_wdata            ),
        .pdu_imem_we         (pdu_imem_we               ),

        .pdu_dmem_addr       (pdu_dmem_addr             ),
        .pdu_dmem_rdata      (dmem_pdu_rdata            ),
        .pdu_dmem_rdata_valid(dmem_pdu_rdata_valid      ),
        .pdu_dmem_re         (pdu_dmem_re               ),       // Unused
        .pdu_dmem_wdata      (pdu_dmem_wdata            ),
        .pdu_dmem_we         (pdu_dmem_we               ),

        .imem_addr           (imem_addr                 ),
        .imem_rdata          (imem_rdata                ),
        .imem_wdata          (imem_wdata                ),
        .imem_we             (imem_we                   ),

        .dmem_addr           (dmem_addr                 ),
        .dmem_rdata          (dmem_rdata                ),
        .dmem_wdata          (dmem_wdata                ),
        .dmem_we             (dmem_we                   )
    );


    // MEMORY
    // USE IP
    INST_MEM instruction_memory (
        .clk                    (CLK_50MHZ              ),
        .a                      (imem_addr[10:2]        ),
        .spo                    (imem_rdata             ),
        .we                     (imem_we                ),
        .d                      (imem_wdata             )
    );

    DATA_MEM data_memory (
        .clk                    (CLK_50MHZ              ),
        .a                      (dmem_addr[10:2]        ),
        .spo                    (dmem_rdata             ),
        .we                     (dmem_we                ),
        .d                      (dmem_wdata             )
    );



    Segment segment (
        .clk                    (CLK_50MHZ              ),
        .rst                    (rst                    ),
        .output_data            (dbg_data               ),
        .seg_data               (seg_data               ),
        .seg_an                 (seg_an                 )
    );

endmodule