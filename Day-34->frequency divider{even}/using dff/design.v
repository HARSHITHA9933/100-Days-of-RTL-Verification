module d_flipflop(inut clk,reset,d, output reg q);
  always @(posedge clk) begin
    if(reset)
      q<=0;
    else
      q<=d;
  end
endmodule
module clock_divider(input clk,reset, output reg f4);
  wire q2;
  d_flipflop dff1(clk,reset,~f4,q2);
  d_flipflop dff2(clk,reset,q2,f4);
endmodule
