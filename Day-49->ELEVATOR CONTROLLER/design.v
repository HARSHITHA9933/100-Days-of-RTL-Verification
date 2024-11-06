module bcd72seg(input wire [6:0] sseg, output reg[3:0]bcd);
  always @(*) begin
    case(seg)
      7'b1000000:bcd=4'b0000;
      7'b1111001:bcd=4'b0001;
      7'b0100100:bcd=4'b0010;
      7'b0110000:bcd=4'b0011;
      7'b0010010:bcd=4'b0100;
      7'b0000010:bcd=4'b0101;
      7'b1111000:bcd=4'b0110;
      7'b0000000:bcd=4'b0111;
      7'b0010000:bcd=4'b1001;
      default:bcd=4'b1111;
    endcase
  end
endmodule
module elevator(clk,rst,reqG,reqF1,reqF2,reqF3,overload,firealarm,person_detected,door_open,door_closed,bcd_floor,seq,prox);
  input wire clk,rst;
  input wire reqG,reqF1,reqF2,reqF3;
  input wire overload,firealarm;
  input wire person_detected;
  output reg door_open,door_closed;
  output reg[3:0]bcd_floor;
  output reg[6:0]seg;
  output reg[1:0]prox;
  parameter IDLE=3'b000,G=3'b001,F1=3'b010,F2=3'b011,F3=3'b100,doorclosedelay=3'b101;
  reg[2:0]state,nxt_state;
  reg[3:0]door_timer;
  bcd27seg inst(.bcd(bcd_floor), .seg(seg));
  initial begin
    state=IDLE;
    door_open=0;
    door_closed=1;
    prox=0;
    seg=7b11111111;
    door_timer=0;
  end
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      state<=IDLE;
      door_timer<=0;
    end else begin
      state<=nxt_state;
      if(state==doorclosedelay)
        door_timer<=door_timer+1;
      else
        door_timer<=0;
    end
  end
  always @(*) begin
    case(state)
      IDLE:begin
        if(firealarm)
          nxt_state=G;
        else if(overload)
          nxt_state=state;
        else if(reqF1)
          nxt_state=F1;
        else if(reqF2)
          nxt_state=F2;
        else if(reqF3)
          nxt_state=F3;
        else
          nxt_state=IDLE;
      end
      G:nxt_state=(firealarm)?G:(overload?G:(reqF1?F1:(person_detected?doorclosedelay:G)));
      F1:nxt_state=(firealarm)?G:(overload?F1:(reqF2?F2:(person_detected?doorclosedelay:F1)));
      F2:nxt_state=(firealarm)?G:(overload?F2:(reqF3?F3:(person_detected?doorclosedelay:F2)));
      F3:nxt_state=(firealarm)?G:(overload?F3:(reqG?G:(person_detected?doorclosedelay:F3)));
      doorclosedelay:nxt_state=(door_timer<3)?doorclosedelay:IDLE;
      default:nxt_state=IDLE;
    endcase
  end
  always (state or person_detected) begin
    case(state)
      G:begin
        prox=2'b00;
        door_open=1;
        door_closed=0;
        seg=7'b1000000;
      end
      F1:begin
        prox=2'b01;
        door_open=1;
        door_closed=0;
        seg=7'b1111001;
      end
      F2:begin
        prox=2'b10;
        door_open=1;
        door_closed=0;
        seg=7'b0100100;
      end
      F3:begin
        prox=2'b11;
        door_open=1;
        door_closed=0;
        seg=7'b0110000;
      end
      doorclosedelay:begin
        door_open=0;
        door_closed=1;
        seg=7'b11111111;
      end
      default:begin
        door_open=0;
        door_closed=1;
        seg=7'b1000000;
      end
    endcase
  end
endmodule
        
      
  
