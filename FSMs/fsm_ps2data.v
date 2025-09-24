module top_module(
  input clk,
  input [7:0] in,
  input reset,    // Synchronous reset
  output [23:0] out_bytes,
  output done
  );

  parameter A = 0, B = 1, C = 2, D = 3;
  reg [1:0] state, next_state;
  reg [23:0] out;
  


//Implementing Mealy FSM

  // State transition logic (combinational)
  always @( * ) begin
    case (state)
      A:
      begin
        next_state = in[3]? B: A;
        done = 1'b0;
        out[23:16]= in;

        if (in[3])
        begin
          next_state = B;
          done = 1'b0;
          out[23:16]= in;
        end
        else
        begin
          next_state = A;
          done = 1'b0;
          out[23:16]= 8'h00;
        end
      end 
      B:
      begin
        next_state = C;
        done = 1'b0;
        out[15:8]= in;
      end 
      C:
      begin
        next_state = D;
        done = 1'b0;
        out[7:0]= in;
      end 
      D:
      begin
        out_bytes = out;
        done = 1'b1;
        next_state = in[3]? B: A;

        // if (in[3]) 
        // begin
        //   out[23:16]= in;
        //   next_state = B;
        // end
        // else
        //   next_state = A;

      end 
      default: next_state = state;
    endcase
  end

  // State flip-flops (sequential)
  always @(posedge clk ) begin
    state <= reset? A: next_state;
  end

endmodule
