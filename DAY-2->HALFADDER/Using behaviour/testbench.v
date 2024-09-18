`include "halfadder.v"
module testbench(output reg a,b,input wire sum,carry);
  halfadder dut(a,b,sum,carry);
  initial begin
    $monitor("Time=%t a=%b b=%b sum=%b carry=%b",$time,a,b,sum,carry);
    #1 a=0;b=0;
    #1 a=0;b=1;
    #1 a=1;b=0;
    #1 a=1;b=1;
  end
endmodule
