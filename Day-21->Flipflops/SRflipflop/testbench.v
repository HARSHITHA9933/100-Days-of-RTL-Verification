`include "srff.v"
module srff_test(clk,s,r,q);
  input wire q;
  output reg clk,s,r;
  srff inst(.clk(clk), .s(s), .r(r), .q(q));
  initial begin
    $monitor("Time=%t clk=%b s=%b r=%b q=%b",$time,clk,s,r,q);
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    #10 s=0;r=0;
    #10 s=0;r=1;
    #10 s=1;r=0;
    #10 s=1;r=1;
    #10
    $finish;
  end
endmodule
  
