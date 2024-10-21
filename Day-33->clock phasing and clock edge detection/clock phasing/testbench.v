`include "clock_phase.v"
module clock_phase_test;
  reg clk;
  reg rst;
  wire clk_0;
  wire clk_90;
  wire clk_180;
  wire clk_270;
  clock_phase inst(clk,rst,clk_0,clk_90,clk_180,clk_270);
  initial begin
    clk=0;
    forever #1 clk=~clk;
  end
  initial begin
    rst=1;
    #5 rst=0;
    #50 $finish;
  end
endmodule
      
