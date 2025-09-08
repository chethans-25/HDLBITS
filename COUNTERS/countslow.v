module top_module (
  input clk,
  input slowena,
  input reset,
  output [3:0] q);

  initial begin
    q<=0;
  end
  always @(posedge clk ) begin
    if(reset==0 & slowena == 1 & q<9)
      q <= q+1;
    else if(reset == 0 & slowena == 0 )
      q <= q;
    else if (reset == 1 | q >=9)
      q <= 0;
  end

endmodule
