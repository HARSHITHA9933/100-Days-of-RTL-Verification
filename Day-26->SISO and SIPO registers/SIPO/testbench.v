`include "sipo reg.v"
module sipo_reg_test;
reg clk,d;
wire [3:0] q;
always #10 clk=-clk;
sipo reg inst(.clk(clk), d(d), .q(q));
initial begin
  $monitor("Time=>%0t q=%b d=%b", $time,q,d);
clk=0;
#10 d=0;
#20 d=1;
#20 d=1;
#20 d=0;
#20 d=0;
#20 d=0;
#20 d=0;
#20 d=0;
#20
$finish;
end
endmodule
