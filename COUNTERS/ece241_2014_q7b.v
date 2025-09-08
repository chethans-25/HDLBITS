module top_module (
  input clk,
  input reset,
  output OneHertz,
  output [2:0] c_enable
);
  reg hertz1;
  reg hertz2;
	reg [3:0] counter1_out;
	reg [3:0] counter2_out;
	reg [3:0] counter3_out;
  initial hertz1=1'b0;
  initial hertz2=1'b0;

bcdcount counter1 (
  .clk(clk),
  .reset(reset|(counter1_out==4'h9)),
  .enable(1'b1),
  .Q(counter1_out)
);

bcdcount counter2 (
  .clk(clk),
  .reset( reset|({counter2_out,counter1_out}==8'h99)), 
  .enable(counter1_out == 4'h9),
  .Q(counter2_out)
);

bcdcount counter3 (
  .clk(clk),
  .reset(reset | ({counter3_out,counter2_out,counter1_out} == 12'h999)),  
  .enable({counter2_out,counter1_out} == 8'h99),
  .Q(counter3_out)
);

  assign c_enable[0] = 1'b1;
  assign c_enable[1] = (counter1_out == 'h9);
  assign c_enable[2] = {counter2_out,counter1_out} == 8'h99;

  always @(c_enable[2]) begin
    OneHertz = (c_enable[2] == 1 && counter3_out == 'h9)?hertz1:hertz2;
  end

  always@(posedge c_enable[2]) 
  begin
    if (reset==1)
      hertz1 <= 0;
    else if(c_enable[1])
      hertz1 <= ~hertz1;
    else
    hertz1 <= 0;
  end

  always@(negedge c_enable[2]) 
  begin
    hertz2 <= 0;
  end

endmodule