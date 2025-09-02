// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );

  always @(*) begin
    casez (in)
      'bzzzzzzz1: pos = 0; 
      'bzzzzzz1z: pos = 1; 
      'bzzzzz1zz: pos = 2; 
      'bzzzz1zzz: pos = 3; 
      'bzzz1zzzz: pos = 4; 
      'bzz1zzzzz: pos = 5; 
      'bz1zzzzzz: pos = 6; 
      'b1zzzzzzz: pos = 7; 
      default: pos = 0;
    endcase
  end

endmodule
