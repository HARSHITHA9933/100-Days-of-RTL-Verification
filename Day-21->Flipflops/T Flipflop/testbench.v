`include "tff.v"
module tff_test(t,clk,q);
  input wire q;
  output reg t,clk;
  tff inst(.t(t), .clk(clk), .q(q));
  initial begin
    clk=0;
  forever #10 clk=~clk;
  end
  initial begin
    $monitor("Time=%t t=%b clk=%b q=%b",$time,t,clk,q);
    #10 t=0;
    #20 t=1;
    #20 t=0;
    #20 t=1;
    #20
    $finish;
  end
endmodule
