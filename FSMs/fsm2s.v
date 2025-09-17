module top_module(
  input clk,
  input reset,    // Synchronous reset to OFF
  input j,
  input k,
  output out);

  parameter OFF=0, ON=1;
  reg state, next_state;

  // State transition logic
  always @(*)
  begin
    case (state)
      OFF:next_state = j?ON:OFF;
      ON: next_state = k?OFF:ON;
      default: next_state = state;
    endcase
  end

  // State flip-flops with synchronous reset
  always @(posedge clk)
  begin
    state <= reset? OFF : next_state;
  end

  // Output logic
  assign out = (state == ON);

endmodule
