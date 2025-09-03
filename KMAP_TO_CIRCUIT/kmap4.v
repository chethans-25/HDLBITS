module top_module(
  input a,
  input b,
  input c,
  input d,
  output out  ); 
  
  //standard circuit - xor gate
	assign out = a^b^c^d;
  
endmodule
