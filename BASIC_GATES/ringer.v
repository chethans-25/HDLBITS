module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
  // using assign statement
  // assign {ringer,motor}= { ring&~vibrate_mode , ring&vibrate_mode };

  // using comb always block
  always @(*) begin
    if (ring) begin
      if (vibrate_mode) begin
        motor = 1;
        ringer = 0;
      end
      else begin
        ringer = 1;
        motor = 0;
      end
    end
    else
      {ringer, motor} = 2'b00;
  end
endmodule
