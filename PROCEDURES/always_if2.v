// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  );

    always @(*) begin//shut off the computer only if it's really overheated
      shut_off_computer = cpu_overheated;
    end

    always @(*) begin//stop driving if you've arrived at your destination or you need to refuel.
      if(arrived | gas_tank_empty)  keep_driving = 0;
      else  keep_driving = 1;
    end

endmodule
