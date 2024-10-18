`include "modncounter.v"
module modncounter_test;
  wire [3:0] out;
  reg clk;
  modncounter inst(clk,out);
  always #20 clk=~clk;
  initial begin
    $monitor("Time=%t out=%d",$time,out);
    clk=0;
    #500;
    $finish;
  end
endmodule
