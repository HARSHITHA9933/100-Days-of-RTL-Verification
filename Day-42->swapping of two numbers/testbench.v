`include "swapping.v"
module swapping_test;
  reg [7:0] a,b;
  wire[7:0] a_out,b_out;
  swapping inst(a,b,a_out,b_out);
  initial begin
    $monitor("Time=%0t=> a=%0d b=%0d a_out=%0d b_out=%0d",$time,a,b,a_out,b_out);
    #10 a=1; b=2;
    #10 a=5; b=12;
    #10 a=22; b=24;
    #10 a=15; b=30;
    #10 a=50; b=25;
    #50;
    $finish;
  end
endmodule
  
    
