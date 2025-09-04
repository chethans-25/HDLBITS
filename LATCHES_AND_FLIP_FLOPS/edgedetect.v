module top_module (
  input clk,
  input [7:0] in,
  output [7:0] pedge
);

reg [7:0] past_in;

always @(posedge clk) begin
  past_in <= in;
  pedge <= (in & ~past_in);
  // xor gate should not be used because it is required to check posedge only.
  //xor gate checks both posedge and negedge
end

endmodule
