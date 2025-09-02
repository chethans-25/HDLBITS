module top_module( 
  input [2:0] a, b,
  input cin,
  output [2:0] cout,
  output [2:0] sum );

genvar i;
generate
  for (i = 0; i < 3 ; i++ ) begin: full_adder //requires name
    FA full_adder_ins (.a(a[i]), .b(b[i]), .cin(i==0? cin: cout[i-1]), .cout(cout[i]), .sum(sum[i]));
  end
endgenerate

endmodule


module FA( 
  input a, b, cin,
  output cout, sum );

  assign {cout, sum} = a + b + cin;
endmodule
