module top_module( 
    input a, b, sel,
    output out ); 

//using ternary operator in assign statement
  assign out = sel? b: a;

//using comb always block
  // always @(*) begin
  //   if (sel)  out = b;
  //   else out = a;
  // end
endmodule
