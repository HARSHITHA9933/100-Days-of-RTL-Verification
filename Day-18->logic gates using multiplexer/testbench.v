`include "logicgates_using_mux.v"
module logicgates_using_mux_test(a,b,y1,y2,y3,y4,y5,y6); 
  output reg a,b;
  input wire y1,y2,y3,y4,y5,уб;
  logicgates_using_mux inst(a,b,y1,y2,y3,y4,y5,y6);
  initial begin
    $monitor("Time=%0t a=%0b b=%0b y1=%0b y2=%0b y3=%0b y4=%0b y5=%0b y6=%0b",$time,a,b,y1,y2,y3,y4,y5,y6);
    #10 a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
    #10;
    $finish;
  end
endmodule
