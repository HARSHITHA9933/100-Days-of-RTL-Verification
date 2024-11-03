`include "design.v"
module testbench;
  reg clk, reset;
  reg [1:0]in;
  wire out;
  wire [1:0] change;
  always #10 clk=~clk;
  vendingmachine inst(clk, reset, in, out, change)
  initial begin
    $monitor("Time=%0t in=%0b out=%0b change=%0b", $time, in, out, change);
    clk=0;
    #10 reset=0;
    #20 reset=1;
   //for one 5/- and one 10/- coins
    #10 in=1;
    #20 in=2;
    //for three 5/- coins
    #10 in=1;
    #20 in=1;
    #20 in=1;
    // for two 10/- coins
    #10 in=2;
    #20 in=2;
   //for two 5/- coins
    #20 in=1;
    #20 in=1;
    #20 
    $finish;
  end
endmodule
