module top_module (
  input [7:0] a,
  input [7:0] b,
  output [7:0] s,
  output overflow
);
  assign s = a+b;
 
  //by comparing sign of inputs and sum
  assign overflow = (a[7]&b[7]&~s[7])|(~a[7]&~b[7]&s[7]);

endmodule
