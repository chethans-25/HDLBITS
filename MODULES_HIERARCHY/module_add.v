module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
//add16 is available
wire cout;
add16 add_lo (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(cout), .sum(sum[15:0]));
add16 add_hi (.a(a[31:16]), .b(b[31:16]), .cin(cout), .sum(sum[31:16]));


endmodule
