module top_module (
  input clk,
  input reset,      // Synchronous active-high reset
  output [3:0] q);

  initial begin
    q<=1;
  end
  always @(posedge clk ) begin
    if(reset==1 | q>9)
      q <= 1;
    else
      q <= q+1;
  end

endmodule
