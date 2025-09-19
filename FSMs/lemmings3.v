module top_module(
  input clk,
  input areset,    // Freshly brainwashed Lemmings walk left.
  input bump_left,
  input bump_right,
  input ground,
  input dig,
  output walk_left,
  output walk_right,
  output aaah,
  output digging ); 

  
  parameter LEFT = 0, RIGHT = 1, FALL = 2, DIGGING = 3;
  reg [1:0]state, next_state;
  reg prev; // to store previous walking state
    
  always @(*)
  begin
    case(state)
      LEFT:
      begin
        prev<=1'b0;
        next_state <= (~ground)?FALL: dig? DIGGING: bump_left ? RIGHT : LEFT ;
      end
          
      RIGHT:
      begin
        prev <= 1'b1;
        next_state <= (~ground)?FALL: dig? DIGGING: bump_right? LEFT  : RIGHT;
      end
      
      FALL:
      begin
        next_state <= (ground & prev)?RIGHT:(ground & ~prev)? LEFT:FALL;
      end

      DIGGING:
      begin
        next_state <= ~ground ? FALL : state;
      end
    endcase
  end
    
  always @(posedge clk or posedge areset)
  begin
    state = areset ? LEFT : next_state;
  end

  assign walk_left = (state == LEFT) && ~digging;
  assign walk_right = (state == RIGHT) && ~digging;
  assign aaah = (state == FALL);
  assign digging = (state == DIGGING);


endmodule
