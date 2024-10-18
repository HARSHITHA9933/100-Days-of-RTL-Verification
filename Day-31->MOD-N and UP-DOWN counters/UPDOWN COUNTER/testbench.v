`include "updowncounter.v"
module updown_test;
  wire [3:0] out;
  reg clk,load,up;
  reg [3:0] din;
  updown inst(load,up,din,clk,out);
  always #10 clk=~clk;
  initial begin
    $monitor("Time=%t load=%d din=%d out=%d",$time,load,din,out);
    clk=0;
    #10 load=1;up=1;din=8;
    #20 load=0;
    #20
    #20
    #20
    #20
    #20 load=1;up=0;din=8;
    #20 load=0;
    #20
    #20
    #20
    #20
    $finish;
  end
endmodule
