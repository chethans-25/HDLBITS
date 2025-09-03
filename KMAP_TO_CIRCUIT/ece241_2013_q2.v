module top_module (
  input a,
  input b,
  input c,
  input d,
  output out_sop,
  output out_pos
); 
  //method 1: sop
  assign out_sop = (c&d) | (~a&~b&c);

  //method 2: pos
  assign out_pos = c & (b|~a) & (d|~b);
    
endmodule
