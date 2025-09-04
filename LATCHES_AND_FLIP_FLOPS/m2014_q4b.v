module top_module (
  input clk,
  input d, 
  input ar,   // asynchronous reset
  output q);

  // always @(posedge clk or posedge ar) begin
  //   if (ar)
  //     q <= 0;
  //   else
  //     q <= d;
  // end

  always @(posedge clk or posedge ar)begin
    q<=ar?1'b0:d;
  end


endmodule
