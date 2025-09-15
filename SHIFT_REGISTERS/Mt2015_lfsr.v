module top_module (
  input [2:0] SW,      // R
  input [1:0] KEY,     // L and clk
  output [2:0] LEDR);  // Q

  wire [2:0] tap;
  assign tap = {LEDR[2],1'b0, LEDR[2] }; 

  always @(posedge KEY[0] ) begin
    LEDR <= KEY[1]? SW : tap ^ {LEDR[1], LEDR[0], 1'b0};
  end


endmodule
