module top_module(
  input a,
  input b,
  input c,
  input d,
  output out  ); 
  
  //method 1: sop
  // assign out= (~b&c)|(a);

  //method 2: pos
  assign out= (a|~b)&(a|c);

endmodule
