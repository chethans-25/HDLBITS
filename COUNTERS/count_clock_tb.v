//This is a simple testbench to verify the working of  digital clock (count_clock.v )

module count_clock_tb ();
  reg clk;
  reg reset;
  reg ena;
  wire pm;
  wire [7:0] hh;
  wire [7:0] mm;
  wire [7:0] ss;


  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
    clk = 0;
    // reset = 1;
    ena = 1;
    // hh = 8'h10;
    
    #10 reset = 0;


    #100000 $stop;
  end
  

  always clk = #1 ~clk;

  count_clock inst(.clk(clk), .reset(reset), .ena(ena), .pm(pm), .hh(hh), .mm(mm), .ss(ss));


endmodule