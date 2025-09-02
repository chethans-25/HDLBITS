module top_module( 
  input [399:0] a, b,
  input cin,
  output cout,
  output [399:0] sum );
	
  wire [99:0] carry;
  genvar i;
  generate
    for (i=0;i<100;i=i+1)
      begin : multi_ins //this block requires name//hence this identifier :multi_ins
        bcd_fadd ins ( .a(a[4*i+3:4*i]) , .b(b[4*i+3:4*i]) , .cin(i==0?cin:carry[i-1])  , .cout(carry[i]), .sum(sum[4*i+3:4*i]) );
      end
  endgenerate
  assign cout = carry[99];
endmodule
