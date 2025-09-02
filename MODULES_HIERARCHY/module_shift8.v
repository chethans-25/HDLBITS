module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
//my_dff8 is available
wire [7:0] w1,w2,w3;

my_dff8 inst1(.clk(clk), .d(d), .q(w1));
my_dff8 inst2(.clk(clk), .d(w1), .q(w2));
my_dff8 inst3(.clk(clk), .d(w2), .q(w3));

mux4_1 mux_inst1(.sel(sel), .a0(d), .a1(w1), .a2(w2), .a3(w3), .q(q));

endmodule

module mux4_1(input [1:0] sel, input [7:0] a0, a1, a2, a3, output reg [7:0]q);
  always @(*)
  begin
    case(sel)
      2'b00: q = a0; 
      2'b01: q = a1; 
      2'b10: q = a2; 
      2'b11: q = a3;
      default: q = 8'bx;
    endcase
  end
endmodule