`include "siso reg.v"
module siso_reg_test();
reg d,clk;
wire q;
  siso reg(.d(d), clk(clk), .q(q));
initial begin
clk=1'b0;
forever #5 clk=-clk;
end
initial begin
  $monitor("Time=>%0t clk=%b d=%b q=%b", $time,clk,d,q);
#5 d=0;
#10 d=1;
#10 d=0;
#10 d=1;
#10 d=0;
#10 d=1;
#10 d=0;
#10 d=0;
#10
Sfinish;
end
endmodule