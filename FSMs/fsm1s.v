// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
  input clk;
  input reset;    // Synchronous reset to state B
  input in;
  output out;
  reg out;

// state values
  parameter A=1'b0, B=1'b1; 

// states
  reg present_state, next_state;

  always @(posedge clk) begin
    if (reset)
    begin
      // reset logic
      present_state = B;
      out = 1'b1;
    end

    else
    begin
      // state transition logic
      case (present_state)
        B: next_state = in? B : A;
        A: next_state = in? A: B;
      endcase

      // State flip-flops
      present_state = next_state;

      // Output logic
      case (present_state)
        A: out = 1'b0;
        B: out = 1'b1;
      endcase
    end
  end

endmodule
