module top_module( 
  input [31:0] in,
  output [31:0] out );//

  // method 1
  assign out = {in[7:0],in[15:8],in[23:16],in[31:24]};

  //method 2
  // it is not efficient, use method 1

endmodule
