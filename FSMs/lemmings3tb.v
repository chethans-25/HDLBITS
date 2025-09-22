module lemming3tb();
  reg clk;
  reg areset;
  reg bump_left;
  reg bump_right;
  reg ground;
  reg dig;
  wire walk_left;
  wire walk_right;
  wire aaah;
  wire digging;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    clk = 1'b0;
    dig = 1'b0;
    bump_left = 1'b0;
    bump_right = 1'b0;
    areset = 1'b1;
    ground = 1'b1;

    #10 areset = 1'b0;

    #50 ground = 1'b0;

    #10 ground = 1'b1;

    #500 $stop;
  end

  always clk= #5 ~clk;

  lemmings3 instance1 (
    .clk(clk),
    .areset(areset),
    .bump_left(bump_left),
    .bump_right(bump_right),
    .ground(ground),
    .dig(dig),
    .walk_left(walk_left),
    .walk_right(walk_right),
    .aaah(aaah),
    .digging(digging)
  );



endmodule
