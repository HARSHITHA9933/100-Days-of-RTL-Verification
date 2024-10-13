module dff(d,clk,q);
input wire d,clk;
output reg q;
always @(posedge clk) begin
q<=d;
end
endmodule
module dffpipo(a,clk,qn);
input wire clk;
input wire [3:0]a;
output reg [3:0]qn;
  dff n1(a[0],clk,qn[0]);
  dff n2(a[1],clk,qn[1]);
  dff n3(a[2],clk,qn[2]);
  dff n4(a[3],clk,qn[3]);
endmodule
  
