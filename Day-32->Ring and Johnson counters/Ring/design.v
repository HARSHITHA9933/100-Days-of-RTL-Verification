module dff(q,qbar,d,clk,reset);
  input wire clk,d,reset;
  output reg q=1'b0,qbar;
  always @(posedge clk) begin
    q<=d;
  end
  assign qbar=~q;
endmodule      
module ring_counter(q,qbar,clk,reset);
  input wire clk,reset;
  output reg [3:0] d;
  dff d1(q[0],qbar[0],d[0],clk,reset);
  dff d2(q[1],qbar[1],d[1],clk,reset);
  dff d3(q[2],qbar[2],d[2],clk,reset);
  dff d4(q[3],qbar[3],d[3],clk,reset);
  assign d[0]=reset ? 1'b1 : q[3];
  assign d[1]=reset ? 1'b0 : q[0];
  assign d[2]=reset ? 1'b0 : q[1];
  assign d[3]=reset ? 1'b0 : q[2];
endmodule
