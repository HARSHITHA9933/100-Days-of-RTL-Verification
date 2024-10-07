module dff(d,clk,q);
  input wire d,clk;
  output reg q;
  always @(posedge clk) begin
    q<=d;
  end
endmodule
