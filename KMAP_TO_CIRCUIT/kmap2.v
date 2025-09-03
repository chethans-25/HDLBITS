module top_module(
  input a,
  input b,
  input c,
  input d,
  output out  ); 

// method 1: sop
//three equations possible for this k-map depending on how we pair

  // assign out = (~a&~d) | (~b&~c) | (c&d&a) | (~a&b&c);
  // assign out = (~b&~c) | (~a&~d) | (b&c&d) | (~b&a&d);
  // assign out = (~b&~c) | (~a&~d) | (b&c&d) | (c&d&a);

// method 2: pos
  assign out= (a|b|~c|~d) & (~a|~b|c) & (~b|c|~d) & (~a|~c|d);

endmodule