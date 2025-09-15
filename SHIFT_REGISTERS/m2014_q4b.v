
//Method 1: using MUX Instances
module top_module (
  input [3:0] SW,
  input [3:0] KEY,
  output [3:0] LEDR
);
  MUXDFF unit0 (.clk(KEY[0]), .w(KEY[3]), .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[0]));
  MUXDFF unit1 (.clk(KEY[0]), .w(KEY[3]), .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[1]));
  MUXDFF unit2 (.clk(KEY[0]), .w(KEY[3]), .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[2]));
  MUXDFF unit3 (.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));


endmodule

module MUXDFF (
  input clk,
  input w, R, E, L,
  output Q
);

  always @(posedge clk ) begin
    Q <= L? R: E? w: Q;
  end

endmodule

//Method 2: Directly using MUX logic
/*
module top_module (
  input [3:0] SW,
  input [3:0] KEY,
  output [3:0] LEDR
);
  reg [3:0]q;
  assign LEDR = q;
  always @(posedge KEY[0])begin
    if (KEY[2]) q<=SW;
    else begin
      if (KEY[1]) q<={KEY[3],q[1+:3]};
      else q<=q;
    end
  end
endmodule
*/