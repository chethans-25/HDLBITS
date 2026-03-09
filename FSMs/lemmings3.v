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

  
  parameter LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5;
  reg [2:0]state, next_state;
    
  always @(*)
  begin
    case(state)
      LEFT:
      begin
        next_state = (~ground)?FALL_L: dig? DIG_L: bump_left ? RIGHT : LEFT ;
      end
          
      RIGHT:
      begin
        next_state = (~ground)?FALL_R: dig? DIG_R: bump_right? LEFT  : RIGHT;
      end
      
      FALL_L:
      begin
        next_state = ground ? LEFT : FALL_L;
      end

      FALL_R:
      begin
        next_state = ground ? RIGHT : FALL_R;
      end

      DIG_L:
      begin
        next_state = ~ground ? FALL_L : DIG_L;
      end

      DIG_R:
      begin
        next_state = ~ground ? FALL_R : DIG_R;
      end
    endcase
  end
    
  always @(posedge clk or posedge areset)
  begin
    if (areset)
      state <= LEFT;
    else
      state <= next_state;
  end

  assign walk_left = (state == LEFT);
  assign walk_right = (state == RIGHT);
  assign aaah = (state == FALL_L || state == FALL_R);
  assign digging = (state == DIG_L || state == DIG_R);


endmodule
