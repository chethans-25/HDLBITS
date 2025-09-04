module top_module (
    input clk,
    input x,
    output z
); 
  reg q1, q2, q3;

  assign z = ~(q1 | q2 | q3 );

  DFF ins1 (.clk(clk), .d(q1^x), .q(q1) );
  DFF ins2 (.clk(clk), .d(~q2&x), .q(q2) );
  DFF ins3 (.clk(clk), .d(~q3|x), .q(q3) );

endmodule


module DFF (
  input clk,    // Clocks are used in sequential circuits
  input d,
  output reg q
  );

  always @(posedge clk ) begin
    q <= d;
  end

endmodule
