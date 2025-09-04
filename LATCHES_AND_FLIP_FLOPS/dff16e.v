module top_module (
  input clk,
  input resetn,
  input [1:0] byteena,
  input [15:0] d,
  output [15:0] q
);

//method 1: Using Concatenation

  always @(posedge clk ) begin
    if (~resetn)
      q <= 0;
    else
    begin
      q <= {{8{byteena[1]}}&d[15:8] | {8{~byteena[1]}}&q[15:8],
            {8{byteena[0]}}&d[7:0] | {8{~byteena[0]}}&q[7:0] };
    end
  end
  
//method 2: Using Case statement

// always @(posedge clk)begin
//   if(~resetn) q<=16'h0000;
//   else
//   begin
//     case(byteena)
//       2'b00:q<=q;
//       2'b01:q<={q[15:8],d[7:0]};
//       2'b10:q<={d[15:8],q[7:0]};
//       2'b11:q<=d;
//     endcase
//   end
// end
endmodule
