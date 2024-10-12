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
  d_siso_reg a(d,clk,q[0]);
  d_siso_reg b(q[1],clk,q[2]);
  d_siso_reg c(q[2],clk,q[3]);
  d_siso_reg e(q[3],clk,q);
endmodule
