`include "moore_101_design.v"
module moore_101_design_test;
  reg clk,reset,in;
  wire out;
  always #10 clk=~clk;
  moore_101_design inst(clk,reset,in,out);
  initial begin
    $monitor("Time=%0t=> in=%b out=%b",$time,in,out);
    clk=0;
    #10 reset=0;
    #20 reset=1;
    #20 in=0;
    #20 in=1;
    #20 in=0;
    #20 in=1;
    #20 in=0;
    #20 in=1;
    #20 in=0;
    #20 in=1;
    #20 in=0;
    #20 in=0;
    #20 in=0;
    #20 in=1;
    #20 in=0;
    #20 in=1;
    #20
    $finish;
  end
endmodule
