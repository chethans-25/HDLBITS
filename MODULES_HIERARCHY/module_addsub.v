module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

  wire cout;
  wire [31:0] b_in;
  assign b_in = b ^ {32{sub}};
  add16 ins1 (.a(a[15:0]), .b(b_in[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cout) );
  add16 ins2 (.a(a[31:16]), .b(b_in[31:16]), .cin(cout), .sum(sum[31:16]) );

endmodule
