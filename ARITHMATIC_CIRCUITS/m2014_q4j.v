module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

wire [3:0]cout;
genvar i;
generate
  for (i = 0; i < 4 ; i++ ) begin: full_adder //requires name
    FA full_adder_ins (.a(x[i]), .b(y[i]), .cin(i==0? 0: cout[i-1]), .cout(cout[i]), .sum(sum[i]));
  end
endgenerate

always @(*) begin
  sum[4] = cout[3];
end

endmodule


module FA( 
  input a, b, cin,
  output cout, sum );
  assign {cout, sum} = a + b + cin;
  
endmodule
