module d_ff(clk,d,q,qbar);
  output reg q=0,qbar;
  input wire d,clk;
  always @(posedge clk) begin
    q<=d;
  end
  assign qbar=~q;
endmodule
module d_synchronous_counter(clk,q,qbar);
  input clk;
  output reg[3:0] q,qbar;
  d_ff d1(clk,qbar[0],q[0],qbar[0]);
  d_ff d2(qbar[0],qbar[1],q[1],qbar[1]);
  d_ff d3(qbar[1],qbar[2],q[2],qbar[2]);
  d_ff d4(qbar[2],qbar[3],q[3],qbar[3]);
endmodule
