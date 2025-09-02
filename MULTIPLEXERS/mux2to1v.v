module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

//using ternary operator in assign statement
  assign out = sel? b: a;

//using comb always block
  // always @(*) begin
  //   if (sel)  out = b;
  //   else out = a;
  // end
endmodule
