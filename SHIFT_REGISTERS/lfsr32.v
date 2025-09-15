module top_module(
  input clk,
  input reset,    // Active-high synchronous reset to 32'h1
  output [31:0] q
);
  wire [32:1] tap;
  assign tap = {q[0], 9'd0 , q[0], 19'd0, q[0], q[0]};

  always @(posedge clk ) begin
    q <= reset ? 32'd1 : {1'b0, q[31-:31]}^tap;
  end

endmodule
