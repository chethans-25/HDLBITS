module top_module(
  input in,
  input [1:0] state,
  output [1:0] next_state,
  output out);

  parameter A=0, B=1, C=2, D=3;


  // State transition logic: next_state = f(state, in)
  always @(*) begin
    case (state)
      B,D: next_state = in ? B : C;
      A:   next_state = in ? B : A; 
      C:   next_state = in ? D : A; 
      default: next_state = state;
    endcase
  end

  // Output logic:  out = f(state) for a Moore state machine
  assign out = (state == D);

endmodule
