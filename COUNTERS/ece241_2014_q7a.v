module top_module (
  input clk,
  input reset,
  input enable,
  output [3:0] Q,
  output c_enable,
  output c_load,
  output [3:0] c_d
);

  // Internal signals
  wire [3:0] count_value;
  reg [3:0] load_value;
  reg load;
  
  // Instantiate the count4 module
  count4 the_counter (
    .clk(clk),
    .enable(c_enable),
    .load(c_load),
    .d(c_d),
    .Q(Q)
  );
  
  // Logic to control the counter
  always @(*) begin
    if (reset) begin
      load_value = 4'b0001;
      load = 1;
    end
    else if (enable) begin
      if (Q == 4'b1100) begin // If count reaches 12
        load_value = 4'b0001; // Reset to 1
        load = 1;
      end else begin
        load = 0;
      end
    end
    else begin
      load = 0;
    end
  end
  // Assign outputs
  assign c_enable = enable && !load; // Enable counting only if not loading
  assign c_load = load;
  assign c_d = load_value;

endmodule