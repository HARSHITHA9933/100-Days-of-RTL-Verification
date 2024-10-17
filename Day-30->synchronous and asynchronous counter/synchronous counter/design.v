module dff(input wire d,clk, output reg q=1'b1,qbar);
  always @(posedge clk) begin
    q<=d;
  end
  assign qbar=~q;
endmodule
module d_sync_counter(input wire clk,output reg [3:0]q,qbar);
  wire w1,w2,w3;
  dff d1(qbar[0],clk,q[0],qbar[0]);
  assign w1=(q[0]^q[1]);
  add d2(w1,clk,q[1],qbar[1]);
  assign w2=(q[2]^q[1]&q[0]));
  dff d3(w2,clk,q[2],qbar[2]);
  assign w3=(q[3]^q[2]&q[1]&q[0]));
  dff d4(w3,clk,q[3],qbar[3]);
endmodule
