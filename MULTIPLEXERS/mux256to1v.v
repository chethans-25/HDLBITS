module top_module( 
  input [1023:0] in,
  input [7:0] sel,
  output [3:0] out );

//using assign statement  
  // assign out = in[4*sel+:4];

//using comb always block
always @(*) begin
  out = in[4*sel+:4];
end
endmodule
