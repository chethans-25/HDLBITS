module top_module(
  input clk,
  input areset,    // Freshly brainwashed Lemmings walk left.
  input bump_left,
  input bump_right,
  input ground,
  output walk_left,
  output walk_right,
  output aaah ); 
  
  parameter LEFT=0, RIGHT=1, FALL =2;
  reg [1:0]state, next_state;
  reg prev; // to store previous walking state
    
  always @(*)
  begin
    case(state)
      LEFT:
      begin
        next_state = (~ground)?FALL: bump_left ? RIGHT : LEFT ;
        prev=1'b0;
      end
          
      RIGHT:
      begin
        next_state = (~ground)?FALL: bump_right? LEFT  : RIGHT;
        prev = 1'b1;
      end
      
      FALL:
      begin
        next_state = (ground & prev)?RIGHT:(ground & ~prev)? LEFT:FALL;
      end
    endcase
  end
    
  always @(posedge clk or posedge areset)
  begin
    state = areset ? LEFT : next_state;
  end

  assign walk_left = (state == LEFT);
  assign walk_right = (state == RIGHT);
  assign aaah = (state == FALL);
endmodule
