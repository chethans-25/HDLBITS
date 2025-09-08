module top_module (
  input clk,
  input reset,      // Synchronous active-high reset
  output [3:0] q);

  initial begin
    q<=0;
  end
  always @(posedge clk ) begin
    if(reset==1 | q>8)
      q <= 0;
    else
      q <= q+1;
  end

endmodule
