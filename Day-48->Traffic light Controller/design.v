module traffic_light_controller(clk,rst,r,g);
  input clk,rst;
  output reg[3:0] r,g;
  reg[2:0] state,n_state;
  reg[3:0] delay_counter;
  always @(posedge clk) begin
    if(rst) begin
      state<=3'b000;
      delay_counter<=4'b0000;
    end
    else begin
      state<=n_state;
      if(state != n_state) begin
        delay_counter<=4'b0000;
      end
      else begin
        delay_counter<=delay_counter+1;
      end
    end
  end
  always @(*) begin
    case(state)
      3'b000:begin
        r<=4'b000;
        g<=4'b000;
        n_state<=3'b001;
      end
      3'b001:begin
        g<=4'b0001;
        r<=4'b1110;
        if(delay_counter==4'd10) begin
          n_state<=3'b010;
        end else begin
          n_state<=3'b001;
        end
      end
      3'b010:begin
        g<=4'b0010;
        r<=4'b1101;
        if(delay_counter==4'd10) begin
          n_state<=3'b011;
        end else begin
          n_state<=3'b010;
        end
      end
      3'b011:begin
        g<=4'b0100;
        r<=4'b1011;
        if(delay_counter==4'd10) begin
          n_state<=3'b100;
        end else begin
          n_state<=3'b011;
        end
      end
      3'b100:begin
        g<=4'b1000;
        r<=4'b0111;
        if(delay_counter==4'd10) begin
          n_state<=3'b001;
        end else begin
          n_state<=3'b100;
        end
      end
      default:n_state<=3'b000;
    endcase
  end
endmodule
