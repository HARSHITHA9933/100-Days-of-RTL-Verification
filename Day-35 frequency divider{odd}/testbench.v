`include "freqby3.v"
module freqby3 tb(clk, reset, out);
output reg clk, reset;
input wire out;
freqby3 dut (clk, reset, out);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
  $monitor(Time=%0t clk=%0b reset=%0d out=%0b", $time,clk,reset,out);
reset=1'b1;
#10
reset=1'b0;
#100
$finish;
end
endmodule
