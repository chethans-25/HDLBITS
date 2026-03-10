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

  
  parameter LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5, SPLAT = 6;
  reg [2:0]state, next_state;
  reg [4:0]counter = 0;
    
  always @(*)
  begin
    case(state)
      LEFT:
      begin
        // counter = 0;
        next_state = (~ground)?FALL_L: dig? DIG_L: bump_left ? RIGHT : LEFT ;
      end
          
      RIGHT:
      begin
        // counter = 0;
        next_state = (~ground)?FALL_R: dig? DIG_R: bump_right? LEFT  : RIGHT;
      end
      
      FALL_L:
      begin
        // counter = counter + 1;
        if (counter >= 20 && ground == 1)
          next_state = SPLAT;
        else if (ground)
          next_state = LEFT;
        else
          next_state = FALL_L;
      end

      FALL_R:
      begin
        // counter = counter + 1;
        if (counter >= 20 && ground == 1)
          next_state = SPLAT;
        else if (ground)
          next_state = RIGHT;
        else
          next_state = FALL_R;
      end

      DIG_L:
      begin
        // counter = 0;
        next_state = ~ground ? FALL_L : DIG_L;
      end

      DIG_R:
      begin
        // counter = 0;
        next_state = ~ground ? FALL_R : DIG_R;
      end

      SPLAT:
      begin
        // counter = 0;
        next_state = areset ? LEFT : SPLAT;
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

  always @(posedge clk) begin
    if (state == FALL_L || state == FALL_R)
      counter <= counter + 1;
    else
      counter <= 0;
  end

  assign walk_left = (state == LEFT);
  assign walk_right = (state == RIGHT);
  assign aaah = (state == FALL_L || state == FALL_R);
  assign digging = (state == DIG_L || state == DIG_R);


endmodule
