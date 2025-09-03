module top_module ( 
  input [15:0] a, b,
  input cin,
  output cout,
  output [15:0] sum );

genvar i;
wire [3:0] carry;

generate
  for (i = 0; i < 4 ; i++ ) begin: bcd_ins
    //method 1
    // bcd_fadd bcd_ins(.a(a[4*i+3 : 4*i]), .b(b[4*i+3 : 4*i]), .cin(i==0?cin:carry[i-1]), .cout(carry[i]), .sum(sum[4*i+3 : 4*i]) );
    
    //method 2, using -: operator
    bcd_fadd bcd_ins(.a(a[4*i+3 -: 4]), .b(b[4*i+3 -: 4]), .cin(i==0?cin:carry[i-1]), .cout(carry[i]), .sum(sum[4*i+3 -: 4]) );
  end
endgenerate

assign cout = carry[3];

endmodule
