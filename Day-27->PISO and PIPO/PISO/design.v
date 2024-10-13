module dff(d,clk,q);
input wire d,clk;
output reg q;
always @(posedge clk) begin
q<=d;
end
endmodule
module dffpiso(a,clk, load,qn);
input wire clk, load;
input wire [3:0]a;
output reg [3:0]qn;
wire [8:0]w;
assign load=1'be;
dff nl(a[0],clk,qn[0]);
  assign w[0]=(load&qn[0]);
  assign w[l]=(~load&a[1]);
  assign w[2]=(w[0]|w[1]);
  dff n2(w[2],clk,qn[1]);
  assign w[3]=(load&qn[1]);
  assign w[4]=(~load&a[2]);
  assign w[5]=(w[4]|w[3]);
  dff n3(w[5],clk,qn[2]);
  assign w[6]=(load&qn[2]);
  assign w[7]=(~load&a[3]);
  assign w[8]=(w[6]|w[7]);
  dff n4(w[8],clk,qn[3]);
endmodule
