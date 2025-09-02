module top_module( 
  input [99:0] a, b,
  input cin,
  output [99:0] cout,
  output [99:0] sum );
  FA ins0 ( .a(a[0]) , .b(b[0]) , .c(cin)  , .cout(cout[0]), .sum(sum[0]) );
  genvar i;
  generate
    for (i=1;i<100;i=i+1)
      begin : multi_ins //this block requires name//hence this identifier :multi_ins
        FA ins ( .a(a[i]) , .b(b[i]) , .c(cout[i-1])  , .cout(cout[i]), .sum(sum[i]) );
      end
  endgenerate
    
    
endmodule

module FA( 
  input a, b, c,
  output cout, sum );
  assign {cout,sum} = a+b+c;
endmodule

