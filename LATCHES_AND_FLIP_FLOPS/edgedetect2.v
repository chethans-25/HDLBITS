module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

reg [7:0] past_in;

always @(posedge clk) begin
  past_in <= in;
  anyedge <= (in ^ past_in);
  // xor gate checks both posedge and negedge
end
endmodule
