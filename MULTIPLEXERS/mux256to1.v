module top_module( 
  input [255:0] in,
  input [7:0] sel,
  output out );

//using assign statement  
  assign out = in[sel];

//using comb always block
// always @(*) begin
//   out = in[sel];
// end

endmodule
