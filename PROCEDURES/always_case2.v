// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    // always @(*) begin //lengthy and time consuming
    //   case (in)
    //     'd1, 'd3, 'd5, 'd7, 'd9, 'd11, 'd13, 'd15: pos = 'd0; 
    //     'd2, 'd6, 'd10, 'd14:                      pos = 'd1; 
    //     'd4, 'd12:                                 pos = 'd2; 
    //     'd8:                                       pos = 'd3; 
    //     default:                                   pos = 'd0;
    //   endcase
    // end


    always @*
        casez (in)//easy
            4'bzzz1: pos = 2'b00;
            4'bzz1z: pos = 2'b01;
            4'bz1zz: pos = 2'b10;
            4'b1zzz: pos = 2'b11;
            default: pos = 2'b00;
        endcase

endmodule
