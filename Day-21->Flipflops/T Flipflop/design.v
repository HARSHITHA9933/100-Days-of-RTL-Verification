module tff(t,clk,q);
  input wire t,clk;
  output reg q=1;
  always @(posedge clk) begin
    if(t)
      q<=~q;
    else
      q<=q;
  end
endmodule
