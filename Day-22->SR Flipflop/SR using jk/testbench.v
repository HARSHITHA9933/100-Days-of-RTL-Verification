`include "srff_using_jkff.v"
module srff_using_jkff_test;
  reg s,r,clk;
  wire q;
  srff_using_jkff inst(.s(s), .r(r), .clk(clk), .q(q));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("time=%t s=%b r=%b clk=%b q=%b",$time,s,r,clk,q);
    #10 s=0;r=0;
    #10 s=0;r=1;
    #10 s=1;r=0;
    #10 s=1;r=1;
    #10;
    $finish;
  end
endmodule
