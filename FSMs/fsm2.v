module top_module(
  input clk,
  input areset,    // Asynchronous reset to OFF
  input j,
  input k,
  output out);

  parameter OFF=0, ON=1; 
  reg state, next_state;

  // State transition logic
  always @(state, j,k)
  begin
    case(state)
      OFF:next_state = j?ON:OFF;
      ON: next_state = k?OFF:ON;
    endcase
  end

  // State flip-flops with asynchronous reset       
  always @(posedge clk, posedge areset) begin
    state <= areset ? OFF : next_state;
  end
  
  // Output logic
  assign out = (state == ON);

endmodule
