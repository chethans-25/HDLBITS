module top_module (
  input clk,
  input reset,
  input [3:1] s,
  output fr3,
  output fr2,
  output fr1,
  output dfr
); 
  reg [3:1]prev_level;
  reg [1:0]state,next_state;
  parameter A=2'B00, B=2'B01 , C=2'B10 , D=2'B11;
  
  always @(*)
  begin
    case(s)
      3'b000:next_state <= D;
      3'b001:next_state <= C;
      3'b011:next_state <= B;
      3'b111:next_state <= A;
    endcase
    

    case(state)
      A:
      begin
        {fr1,fr2,fr3}<=3'b000;
        dfr <= 1'b0;
      end
      B:
      begin
        {fr1,fr2,fr3}<=3'b100;
        case (prev_level)
          A: dfr <= 1'b1; 
          B: dfr <= dfr; 
          default: dfr <= 1'b0;
        endcase
      end
      C:
      begin
        {fr1,fr2,fr3}<=3'b110;
        case (prev_level)
          A,B: dfr <= 1'b1; 
          C: dfr <= dfr; 
          default: dfr <= 1'b0;
        endcase
      end
      D:
      begin
        {fr1,fr2,fr3}<=3'b111;
        dfr <= 1'b1;
      end
    endcase
      
  end


  always @(posedge clk )
  begin
    prev_level <= state;
    state <= reset ? D : next_state;
  end
endmodule
