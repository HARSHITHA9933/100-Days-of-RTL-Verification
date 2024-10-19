module dff(q,qbar,d,clk,reset);
  input wire clk,d,reset;
  output reg q=1'b0,qbar;
  always @(posedge clk) begin
    if(reset) begin
      q<=0;
      qbar<=~q;
    end
    else begin
      q<=d;
      qbar<=~q;
    end
  end
endmodule
module johnson_counter(q,qbar,clk,reset);
  input wire clk,reset;
  output reg [3:0] q,qbar;
  dff d1(q[0],qbar[0],qbar[3],clk,reset);
  dff d2(q[1],qbar[1],q[0],clk,reset);
  dff d3(q[2],qbar[2],q[1],clk,reset);
  dff d4(q[3],qbar[3],q[2],clk,reset);
endmodule
