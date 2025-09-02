module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
  wire [15:0]w0, w1;
  wire cout;

  add16 ins1 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(cout));
  add16 ins2 (.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(w0) );
  add16 ins3 (.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(w1) );
  mux2_1 mux_m1(.sel(cout), .a0(w0), .a1(w1), .sum(sum[31:16]));


endmodule


module mux2_1 (
  input sel,
  input [15:0]a0, a1,
  output [15:0] sum
);
  always @(*) begin
    case (sel)
      0:sum = a0; 
      1:sum = a1; 
      default: sum = 'd0;
    endcase
  end
endmodule