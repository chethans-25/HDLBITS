module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
  // using assign statement
  assign fan = fan_on | (heater ^ aircon);
  assign heater = mode & too_cold;
  assign aircon = ~mode & too_hot;

  // using comb always block
  always @(*) begin
    fan = 0; heater = 0; aircon = 0;// initializing to 0 is important
    if (fan_on == 1) begin
      fan = 1;
    end
    if (mode == 1) begin
      if (too_cold == 1) begin
        aircon = 0;
        heater = 1;
        fan = 1;
      end
    end
    else if (mode == 0) begin
      if (too_hot == 1) begin
        aircon = 1;
        heater = 0;
        fan = 1;
      end
    end
  end
  

endmodule
