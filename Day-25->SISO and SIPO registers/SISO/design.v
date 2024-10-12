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
  output q;
  wire q1,q2,q3
  d_siso_reg a(d,clk,q1);
  d_siso_reg b(q1,clk,q2);
  d_siso_reg c(q2,clk,q3);
  d siso_reg e(q3,clk,q);
endmodule
