module top_module(
  input clk,
  input reset,    // Active-high synchronous reset to 5'h1
  output [4:0] q
); 
  wire [4:0]tap;
  assign tap={q[0],1'b0,q[0],2'b00};
  
  always @(posedge clk)begin
      if (reset) q<=5'h1;
      else q<= {1'b0,q[4-:4]}^tap;
  end
        
endmodule
