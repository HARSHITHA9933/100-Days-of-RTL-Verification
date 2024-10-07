`include "dff.v"
module dff_test(d,clk,q);
  input wire q;
  output reg d,clk;
  dff inst(.d(d), .clk(clk), .q(q));
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
  initial begin
    $monitor("time=%t d=%b clk=%b q=%b",$time,d,clk,q);
    #10 d=0;
    #20 d=1;
    #20
    $finish;
  end
endmodule
