include "elevator.v"
module elevator_tb(clk, rst, reqG, reqF1, reqF2, reqF3, overload, firealarm, person_detected, door_open, door_closed, bcd_floor, seg
prox);
output reg clk, rst;
output reg reqG, reqF1, reqF2, reqF3;
output reg overload, firealarm;
output reg person_detected;
input wire door_open, door_closed;
input wire [3:0]bcd_floor;
input wire [6:0]seg;
input wire [1:0]prox;
elevator dut(clk, rst, reqG, reqF1, reqF2, reqF3, overload, firealarm, person_detected, door_open, door_closed, bcd_floor, seg, prox);
initial begin
  clk=0;
  forever #5 clk=~clk;
end
initial begin
  $monitor("Time=%0t|floor request:G=%0b rF1=%0b F2=%0b F3=%0b|Firealarm=%0b|overload=%0b|person_detected=%0b|position=%0b|door_open=%0b|door_close=%0b|bcd_floor=%0d| seg=%0b", $time, reqG, reqF1, reqF2, reqF3, firealarm, overload, person_detected, prox, door_open, door_closed, bcd_floor, seg);
  rst=1; reqG=0; reqF1=0; reqF2=0; reqF3=0;
  overload=0; firealarm=0; person_detected=0;
  #10 rst=0;
  #10 reqF3=1;
  #20 reqF3=0;
  #5 person_detected =1;
  #20 person_detected =0;
  #10 reqG=1;
  #20 reqG=0;
  #10 reqF2=1;
  #20 reqF2=0;
  #10 firealarm=1;
 #50 firealarm=0;
  #30 overload=1;
  #40 overload=0;
  #10 reqF1=1;
  #20 reqF1=0;
  #300 $finish;
end
endmodule
  
