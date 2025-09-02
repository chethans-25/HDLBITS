module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

  always @(*) begin
    out_different[99] = in[99]^in[0];//this will not be implemented inside the loop
  end

//using generate block and Continuous Assignment Statements
  genvar i;
  generate
    for (i = 0; i < 99 ; i++ )
    begin: CAS_method //requires name
      assign out_both[i] = &in[i+1:i];
      assign out_any[i+1] = |in[i+1:i];
      assign out_different[i] = ^in[i+1:i];
    end:CAS_method
  endgenerate



//using combinational always block
// integer i;
//   always @(*) begin
//     for (i = 0; i < 99 ; i++ ) begin
//       //-:  slicing is to be used (or else this error is thrown: i is not a constant! error)
//       out_both[i] = &in[i+1-:2];
//       out_any[i+1] = |in[i+1-:2];
//       out_different[i] = ^in[i+1-:2];
//     end
//   end

endmodule
