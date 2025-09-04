module top_module (
  input clk,
  input j,
  input k,
  output Q); 

  //JKFF using DFF
  DFF ins(.clk(clk), .d(j&~Q | ~k&Q), .q(Q));

endmodule

module DFF (
  input clk,
  input d,
  output reg q );
  always @(posedge clk ) begin
    q <= d;
  end

endmodule
