module d_siso_reg(d,clk,q);
input d,clk;
output reg q;
always @(posedge clk)
begin q<=d;
end
endmodule
module siso_reg(d,clk,q);
input d;
input clk;
  output [3:0]q;
  wire q1,q2,q3
  d_siso_reg a(d,clk,q[0]);
  d_siso_reg b(q[0],clk,q[1]);
  d_siso_reg c(q[1],clk,q[2]);
d siso rege(q[2],clk,q[3]);
endmodule
