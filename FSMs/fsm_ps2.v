module top_module(
  input clk,
  input [7:0] in,
  input reset,    // Synchronous reset
  output done);

  parameter A = 0, B = 1, C = 2, D = 3;
  reg [1:0] state, next_state;


//Implementing Mealy FSM

  // State transition logic (combinational)
  always @( * ) begin
    case (state)
      A:
      begin
        next_state = in[3]? B: A;
        done = 1'b0;
      end 
      B:
      begin
        next_state = C;
        done = 1'b0;
      end 
      C:
      begin
        next_state = D;
        done = 1'b0;
      end 
      D:
      begin
        next_state = in[3]? B: A;
        done = 1'b1;
      end 
      default: next_state = state;
    endcase
  end

  // State flip-flops (sequential)
  always @(posedge clk ) begin
    state <= reset? A: next_state;
  end



endmodule
