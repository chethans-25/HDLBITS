module top_module (
  input clk,
  input reset,
  input [31:0] in,
  output [31:0] out
);
  reg [31:0] past_in;
  integer i;
  always @(posedge clk ) begin
    past_in <= in;

    for (i=0 ; i<32 ; i++ ) begin
      out[i] <= reset? 0: (in[i]<past_in[i])? 1: out[i];
    end
  end

endmodule