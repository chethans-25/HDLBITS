
module count_clock(
// module top_module(
  input clk,
  input reset,
  input ena,
  output pm,
  output [7:0] hh,
  output [7:0] mm,
  output [7:0] ss); 
  assign pm=reset?1'b0: {hh,mm,ss,pm}=={8'h11,8'h59,8'h59,1'b0}? 1'b1: {hh,mm,ss,pm}=={8'h11,8'h59,8'h59,1'b1}? 1'b0: pm;

  wire ena_mm, ena_hh;
  wire roll_over_ss_low;
  wire roll_over_ss_high;
  wire roll_over_mm_low;
  wire roll_over_mm_high;
  wire roll_over_hh_low;
  wire roll_over_hh_high;

  wire enable_ss_high;
  wire enable_mm_low;
  wire enable_mm_high;
  wire enable_hh_low;
  wire enable_hh_high;

  assign enable_ss_high = (ss[3:0]==4'h9) && ena;
  assign enable_mm_low = (ss==8'h59) && ena;
  assign enable_mm_high = mm[3:0]==4'h9 && enable_mm_low;
  assign enable_hh_low = ((mm==8'h59) && enable_mm_low);
  assign enable_hh_high = ((hh==8'h09 || hh==8'h12)&&(mm==8'h59) && (ss==8'h59) && ena);

  assign roll_over_ss_low = (ss[3:0]==4'h9) && ena;
  assign roll_over_ss_high = (ss==8'h59) && ena;
  assign roll_over_mm_low = (mm[3:0]==4'h9) && roll_over_ss_high;
  assign roll_over_mm_high = (mm==8'h59) && roll_over_ss_high;
  assign roll_over_hh_low = (hh==8'h09 || hh==8'h12) && roll_over_mm_high;
  assign roll_over_hh_high = roll_over_hh_low;

  assign ena_mm = ((ss == 'h59) && ena); //enable minute counter when seconds reaches 59
  assign ena_hh = (({mm,ss} == 'h5959) && ena); //enable hour counter when minutes, seconds reaches 59

  mod10counter ss_low (.clk(clk), .reset(reset || roll_over_ss_low), .reset_value(4'h0), .enable(ena), .q(ss[3:0]));
  mod10counter ss_high (.clk(clk), .reset(reset || roll_over_ss_high), .reset_value(4'h0), .enable(enable_ss_high), .q(ss[7:4]));

  mod10counter mm_low (.clk(clk), .reset(reset || roll_over_mm_low), .reset_value(4'h0), .enable(enable_mm_low), .q(mm[3:0]));
  mod10counter mm_high (.clk(clk), .reset(reset || roll_over_mm_high), .reset_value(4'h0), .enable(enable_mm_high), .q(mm[7:4]));

  mod10counter hh_low (.clk(clk), .reset(reset || roll_over_hh_low), .reset_value(reset?4'h2: (hh==8'h09) ? 4'h0: (hh==8'h12)? 4'h1:4'h0), .enable(enable_hh_low), .q(hh[3:0]));
  mod10counter hh_high (.clk(clk), .reset(reset || roll_over_hh_high), .reset_value(reset?4'h1: (hh==8'h09) ? 4'h1: (hh==8'h12)? 4'h0:4'h0), .enable(enable_hh_high), .q(hh[7:4]));

endmodule



module mod10counter (
  input clk,
  input reset,      // Synchronous active-high reset
  input [3:0]reset_value,
  input enable,
  output reg [3:0] q);

  initial q<=0;

  always @(posedge clk ) begin
    q <= reset? reset_value: ((q == 'h9) && (enable == 'b1))? 'h0:(enable == 'b0)? q: q+'b1;
  end

endmodule
