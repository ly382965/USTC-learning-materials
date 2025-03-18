module INFO_SENDER (
    input                   [ 0 : 0]            clk                 ,
    input                   [ 0 : 0]            rst                 ,

    // TX Data
    output          reg     [ 7 : 0]            tx_data             ,
    output          reg     [ 0 : 0]            tx_data_valid       ,
    input                   [ 0 : 0]            tx_data_accept      ,

    input                   [63 : 0]            print_data          ,

    // Control signals
    input                   [ 0 : 0]            print_logo          ,
    input                   [ 0 : 0]            print_line_head     ,
    input                   [ 0 : 0]            print_enter         ,
    input                   [ 0 : 0]            print_double_enter  ,
    input                   [ 0 : 0]            print_blank         ,

    input                   [ 0 : 0]            print_bp_valid      ,
    input                   [ 0 : 0]            print_bp_invalid    ,
    input                   [ 0 : 0]            print_bp_set        ,
    input                   [ 0 : 0]            print_bp_clear      ,

    input                   [ 0 : 0]            print_cur_pc        ,
    input                   [ 0 : 0]            print_cpu_head      ,

    input                   [ 0 : 0]            print_cmd_not_found ,
    output          reg     [ 0 : 0]            print_done          
);


    localparam WAIT                 = 0;
    localparam SEND_DATA            = 2;
    localparam SEND_WAIT            = 3;
    localparam PRINT_DONE           = 4;
    localparam PRINT_START_LOGO     = 5;
    localparam PRINT_LINE_HEAD      = 6;
    localparam PRINT_ENTER          = 7;
    localparam PRINT_BLANK          = 8;
    localparam PRINT_DOUBLE_ENTER   = 9;
    localparam PRINT_BP_VALID       = 10;
    localparam PRINT_BP_SET         = 11;
    localparam PRINT_BP_CLEAR       = 12;
    localparam PRINT_BP_INVALID     = 13;
    localparam PRINT_CUR_PC         = 14;
    localparam PRINT_CMD_NOT_FOUND  = 15;
    localparam PRINT_CPU_HEAD       = 16;


    reg     [31 : 0]    print_cs, print_ns;
    reg     [ 7 : 0]    buffer [41 : 0];
    wire    [127: 0]    print_data_ascii;
    reg     [63 : 0]    local_print_data;

    always @(posedge clk) begin
        if (rst)
            print_cs <= WAIT;
        else
            print_cs <= print_ns;
    end

    always @(*) begin
        print_ns = print_cs;

        case (print_cs)
            WAIT:
                if (print_logo)
                    print_ns = PRINT_START_LOGO;
                else if (print_line_head)
                    print_ns = PRINT_LINE_HEAD;
                else if (print_enter)
                    print_ns = PRINT_ENTER;
                else if (print_blank)
                    print_ns = PRINT_BLANK;
                else if (print_double_enter)
                    print_ns = PRINT_DOUBLE_ENTER;
                else if (print_bp_valid)
                    print_ns = PRINT_BP_VALID;
                else if (print_bp_invalid)
                    print_ns = PRINT_BP_INVALID;
                else if (print_bp_set)
                    print_ns = PRINT_BP_SET;
                else if (print_bp_clear)
                    print_ns = PRINT_BP_CLEAR;
                else if (print_cur_pc)
                    print_ns = PRINT_CUR_PC;
                else if (print_cpu_head)
                    print_ns = PRINT_CPU_HEAD;
                else if (print_cmd_not_found)
                    print_ns = PRINT_CMD_NOT_FOUND;


            PRINT_START_LOGO, 
            PRINT_LINE_HEAD, 
            PRINT_ENTER, 
            PRINT_BLANK, 
            PRINT_DOUBLE_ENTER,
            PRINT_BP_CLEAR,
            PRINT_BP_SET,
            PRINT_BP_VALID,
            PRINT_BP_INVALID,
            PRINT_CUR_PC,
            PRINT_CPU_HEAD,
            PRINT_CMD_NOT_FOUND
            :
                print_ns = SEND_DATA;

            SEND_DATA:
                print_ns = SEND_WAIT;

            SEND_WAIT:
                if (tx_data_accept) begin
                    if (buffer[0] == 0)
                        print_ns = PRINT_DONE;
                    else
                        print_ns = SEND_DATA;
                end

            PRINT_DONE:
                print_ns = WAIT;
                    
        endcase
    end



    always @(*)
        tx_data = buffer[0];

    always @(*) begin
        tx_data_valid = (print_cs == SEND_DATA);
    end

    always @(*) begin
        print_done = (print_cs == PRINT_DONE);
    end

    always @(posedge clk) begin
        if (rst)
            local_print_data <= 0;
        else if (print_bp_set || print_bp_valid || print_bp_invalid || print_cur_pc)
            local_print_data <= print_data;
    end

    localparam _N = 8'd10;      // "\n"
    localparam _R = 8'd13;      // "\r"

    always @(posedge clk) begin
        if (rst) begin
            buffer[0]   <= 0;
            buffer[1]   <= 0;
            buffer[2]   <= 0;
            buffer[3]   <= 0;
            buffer[4]   <= 0;
            buffer[5]   <= 0;
            buffer[6]   <= 0;
            buffer[7]   <= 0;
            buffer[8]   <= 0;
            buffer[9]   <= 0;
            buffer[10]  <= 0;
            buffer[11]  <= 0;
            buffer[12]  <= 0;
            buffer[13]  <= 0;
            buffer[14]  <= 0;
            buffer[15]  <= 0;
            buffer[16]  <= 0;
            buffer[17]  <= 0;
            buffer[18]  <= 0;
            buffer[19]  <= 0;
            buffer[20]  <= 0;
            buffer[21]  <= 0;
            buffer[22]  <= 0;
            buffer[23]  <= 0;
            buffer[24]  <= 0;
            buffer[25]  <= 0;
            buffer[26]  <= 0;
            buffer[27]  <= 0;
            buffer[28]  <= 0;
            buffer[29]  <= 0;
            buffer[30]  <= 0;
            buffer[31]  <= 0;
            buffer[32]  <= 0;
            buffer[33]  <= 0;
            buffer[34]  <= 0;
            buffer[35]  <= 0;
            buffer[36]  <= 0;
            buffer[37]  <= 0;
            buffer[38]  <= 0;
            buffer[39]  <= 0;
            buffer[40]  <= 0;
            buffer[41]  <= 0;
        end
        else begin
            case (print_cs)
                PRINT_START_LOGO: begin
                    // "USTC COD Project\n"
                    buffer[0]   <=  _N;
                    buffer[1]   <=  _R;
                    buffer[2]   <=  "U";
                    buffer[3]   <=  "S";
                    buffer[4]   <=  "T";
                    buffer[5]   <=  "C";
                    buffer[6]   <=  " ";
                    buffer[7]   <=  "C";
                    buffer[8]   <=  "O";
                    buffer[9]   <=  "D";
                    buffer[10]  <=  " ";
                    buffer[11]  <=  "P";
                    buffer[12]  <=  "r";
                    buffer[13]  <=  "o";
                    buffer[14]  <=  "j";
                    buffer[15]  <=  "e";
                    buffer[16]  <=  "c";
                    buffer[17]  <=  "t";
                    buffer[18]  <=  _N;
                    buffer[19]  <=  _R;
                end

                PRINT_LINE_HEAD: begin
                    // "User: "
                    buffer[0]   <= "U";
                    buffer[1]   <= "s";
                    buffer[2]   <= "e";
                    buffer[3]   <= "r";
                    buffer[4]   <= ":";
                    buffer[5]   <= " ";
                end

                PRINT_ENTER: begin
                    // "\n\r"
                    buffer[0]   <= _N;
                    buffer[1]   <= _R;
                end

                PRINT_BLANK: begin
                    // " "
                    buffer[0]   <= " ";
                end

                PRINT_DOUBLE_ENTER: begin
                    // "\n\n\r"
                    buffer[0]   <= _N;
                    buffer[1]   <= _N;
                    buffer[2]   <= _R;
                end

                PRINT_BP_VALID: begin
                    buffer[0]   <= "B";
                    buffer[1]   <= "r";
                    buffer[2]   <= "e";
                    buffer[3]   <= "a";
                    buffer[4]   <= "k";
                    buffer[5]   <= "p";
                    buffer[6]   <= "o";
                    buffer[7]   <= "i";
                    buffer[8]   <= "n";
                    buffer[9]   <= "t";
                    buffer[10]  <= " ";
                    buffer[11]  <= print_data_ascii[127-:8];
                    buffer[12]  <= " ";
                    buffer[13]  <= "i";
                    buffer[14]  <= "s";
                    buffer[15]  <= " ";
                    buffer[16]  <= "a";
                    buffer[17]  <= "t";
                    buffer[18]  <= " ";
                    buffer[19]  <= "0";
                    buffer[20]  <= "x";
                    buffer[21]  <= print_data_ascii[56+:8];
                    buffer[22]  <= print_data_ascii[48+:8];
                    buffer[23]  <= print_data_ascii[40+:8];
                    buffer[24]  <= print_data_ascii[32+:8];
                    buffer[25]  <= print_data_ascii[24+:8];
                    buffer[26]  <= print_data_ascii[16+:8];
                    buffer[27]  <= print_data_ascii[8 +:8];
                    buffer[28]  <= print_data_ascii[0 +:8];
                    buffer[29]  <= _N;
                    buffer[30]  <= _R;
                end

                PRINT_BP_INVALID: begin
                    buffer[0]   <= "B";
                    buffer[1]   <= "r";
                    buffer[2]   <= "e";
                    buffer[3]   <= "a";
                    buffer[4]   <= "k";
                    buffer[5]   <= "p";
                    buffer[6]   <= "o";
                    buffer[7]   <= "i";
                    buffer[8]   <= "n";
                    buffer[9]   <= "t";
                    buffer[10]  <= " ";
                    buffer[11]  <= print_data_ascii[127-:8];
                    buffer[12]  <= " ";
                    buffer[13]  <= "i";
                    buffer[14]  <= "s";
                    buffer[15]  <= " ";
                    buffer[16]  <= "e";
                    buffer[17]  <= "m";
                    buffer[18]  <= "p";
                    buffer[19]  <= "t";
                    buffer[20]  <= "y";
                    buffer[21]  <= _N;
                    buffer[22]  <= _R;
                end

                PRINT_BP_CLEAR: begin
                    buffer[0]   <= "B";
                    buffer[1]   <= "r";
                    buffer[2]   <= "e";
                    buffer[3]   <= "a";
                    buffer[4]   <= "k";
                    buffer[5]   <= "p";
                    buffer[6]   <= "o";
                    buffer[7]   <= "i";
                    buffer[8]   <= "n";
                    buffer[9]   <= "t";
                    buffer[10]  <= "s";
                    buffer[11]  <= " ";
                    buffer[12]  <= "h";
                    buffer[13]  <= "a";
                    buffer[14]  <= "v";
                    buffer[15]  <= "e";
                    buffer[16]  <= " ";
                    buffer[17]  <= "b";
                    buffer[18]  <= "e";
                    buffer[19]  <= "e";
                    buffer[20]  <= "n";
                    buffer[21]  <= " ";
                    buffer[22]  <= "c";
                    buffer[23]  <= "l";
                    buffer[24]  <= "e";
                    buffer[25]  <= "a";
                    buffer[26]  <= "r";
                    buffer[27]  <= "e";
                    buffer[28]  <= "d";
                    buffer[29]  <= _N;
                    buffer[30]  <= _R;
                end

                PRINT_BP_SET: begin
                    buffer[0]   <= "S";
                    buffer[1]   <= "e";
                    buffer[2]   <= "t";
                    buffer[3]   <= " ";
                    buffer[4]   <= "b";
                    buffer[5]   <= "r";
                    buffer[6]   <= "e";
                    buffer[7]   <= "a";
                    buffer[8]   <= "k";
                    buffer[9]   <= "p";
                    buffer[10]  <= "o";
                    buffer[11]  <= "i";
                    buffer[12]  <= "n";
                    buffer[13]  <= "t";
                    buffer[14]  <= " ";
                    buffer[15]  <= print_data_ascii[127-:8];
                    buffer[16]  <= " ";
                    buffer[17]  <= "t";
                    buffer[18]  <= "o";
                    buffer[19]  <= " ";
                    buffer[20]  <= "0";
                    buffer[21]  <= "x";
                    buffer[22]  <= print_data_ascii[56+:8];
                    buffer[23]  <= print_data_ascii[48+:8];
                    buffer[24]  <= print_data_ascii[40+:8];
                    buffer[25]  <= print_data_ascii[32+:8];
                    buffer[26]  <= print_data_ascii[24+:8];
                    buffer[27]  <= print_data_ascii[16+:8];
                    buffer[28]  <= print_data_ascii[8 +:8];
                    buffer[29]  <= print_data_ascii[0 +:8];
                    buffer[30]  <= _N;
                    buffer[31]  <= _R;
                end

                PRINT_CUR_PC: begin
                    buffer[0]   <= "C";
                    buffer[1]   <= "u";
                    buffer[2]   <= "r";
                    buffer[3]   <= "r";
                    buffer[4]   <= "e";
                    buffer[5]   <= "n";
                    buffer[6]   <= "t";
                    buffer[7]   <= " ";
                    buffer[8]   <= "P";
                    buffer[9]   <= "C";
                    buffer[10]  <= " ";
                    buffer[11]  <= "i";
                    buffer[12]  <= "s";
                    buffer[13]  <= " ";
                    buffer[14]  <= "a";
                    buffer[15]  <= "t";
                    buffer[16]  <= " ";
                    buffer[17]  <= "0";
                    buffer[18]  <= "x";
                    buffer[19]  <= print_data_ascii[56+:8];
                    buffer[20]  <= print_data_ascii[48+:8];
                    buffer[21]  <= print_data_ascii[40+:8];
                    buffer[22]  <= print_data_ascii[32+:8];
                    buffer[23]  <= print_data_ascii[24+:8];
                    buffer[24]  <= print_data_ascii[16+:8];
                    buffer[25]  <= print_data_ascii[8 +:8];
                    buffer[26]  <= print_data_ascii[0 +:8];
                    buffer[27]  <= _N;
                    buffer[28]  <= _R;
                end

                PRINT_CMD_NOT_FOUND: begin
                    buffer[0]   <= _N;
                    buffer[1]   <= _R;
                    buffer[2]   <= "C";
                    buffer[3]   <= "o";
                    buffer[4]   <= "m";
                    buffer[5]   <= "m";
                    buffer[6]   <= "a";
                    buffer[7]   <= "n";
                    buffer[8]   <= "d";
                    buffer[9]   <= " ";
                    buffer[10]  <= "n";
                    buffer[11]  <= "o";
                    buffer[12]  <= "t";
                    buffer[13]  <= " ";
                    buffer[14]  <= "f";
                    buffer[15]  <= "o";
                    buffer[16]  <= "u";
                    buffer[17]  <= "n";
                    buffer[18]  <= "d";
                    buffer[19]  <= _N;
                    buffer[20]  <= _R;
                end

                PRINT_CPU_HEAD: begin
                    buffer[0]   <=  _N;
                    buffer[1]   <=  _R;
                    buffer[2]   <=  "-";
                    buffer[3]   <=  "-";
                    buffer[4]   <=  "-";
                    buffer[5]   <=  "-";
                    buffer[6]   <=  "-";
                    buffer[7]   <=  "-";
                    buffer[8]   <=  "-";
                    buffer[9]   <=  "-";
                    buffer[10]  <=  "-";
                    buffer[11]  <=  "-";
                    buffer[12]  <=  " ";
                    buffer[13]  <=  "C";
                    buffer[14]  <=  "P";
                    buffer[15]  <=  "U";
                    buffer[16]  <=  " ";
                    buffer[17]  <=  "-";
                    buffer[18]  <=  "-";
                    buffer[19]  <=  "-";
                    buffer[20]  <=  "-";
                    buffer[21]  <=  "-";
                    buffer[22]  <=  "-";
                    buffer[23]  <=  "-";
                    buffer[24]  <=  "-";
                    buffer[25]  <=  "-";
                    buffer[26]  <=  "-";
                    buffer[27]  <=  _N;
                    buffer[28]  <=  _R;
                end



                SEND_DATA: begin
                    buffer[0]   <= buffer[1] ;
                    buffer[1]   <= buffer[2] ;
                    buffer[2]   <= buffer[3] ;
                    buffer[3]   <= buffer[4] ;
                    buffer[4]   <= buffer[5] ;
                    buffer[5]   <= buffer[6] ;
                    buffer[6]   <= buffer[7] ;
                    buffer[7]   <= buffer[8] ;
                    buffer[8]   <= buffer[9] ;
                    buffer[9]   <= buffer[10];
                    buffer[10]  <= buffer[11];
                    buffer[11]  <= buffer[12];
                    buffer[12]  <= buffer[13];
                    buffer[13]  <= buffer[14];
                    buffer[14]  <= buffer[15];
                    buffer[15]  <= buffer[16];
                    buffer[16]  <= buffer[17];
                    buffer[17]  <= buffer[18];
                    buffer[18]  <= buffer[19];
                    buffer[19]  <= buffer[20];
                    buffer[20]  <= buffer[21];
                    buffer[21]  <= buffer[22];
                    buffer[22]  <= buffer[23];
                    buffer[23]  <= buffer[24];
                    buffer[24]  <= buffer[25];
                    buffer[25]  <= buffer[26];
                    buffer[26]  <= buffer[27];
                    buffer[27]  <= buffer[28];
                    buffer[28]  <= buffer[29];
                    buffer[29]  <= buffer[30];
                    buffer[30]  <= buffer[31];
                    buffer[31]  <= buffer[32];
                    buffer[32]  <= buffer[33];
                    buffer[33]  <= buffer[34];
                    buffer[34]  <= buffer[35];
                    buffer[35]  <= buffer[36];
                    buffer[36]  <= buffer[37];
                    buffer[37]  <= buffer[38];
                    buffer[38]  <= buffer[39];
                    buffer[39]  <= buffer[40];
                    buffer[40]  <= buffer[41];
                    buffer[41]  <= 0; 
                end
            endcase
        end
    end

    
    Hex2ASC #(16) hex2asc (
        .number (local_print_data   ),
        .ascii  (print_data_ascii   )
    );

endmodule