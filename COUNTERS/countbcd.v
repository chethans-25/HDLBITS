module top_module (
  input clk,
  input reset,   // Synchronous active-high reset
  output [3:1] ena,
  output [15:0] q);

  assign ena = { q[11:0]=='h999, q[7:0]=='h99, q[3:0]=='h9 };

  genvar i;
  generate
    for ( i=0 ; i<4 ; i++ ) begin: instances
      mod10counter inst (.clk(clk), .reset(reset), .enable(i==0?1:ena[i]), .q(q[4*i+3:4*i]));
    end
  endgenerate

endmodule


module mod10counter (
  input clk,
  input reset,      // Synchronous active-high reset
  input enable,
  output [3:0] q);

  initial q<=0;

  always @(posedge clk ) begin
    q <= reset? 'h0: (q == 'h9 & enable == 1)? 'h0:(enable == 0)? q: q+1;
  end

endmodule
