module edgedetection(clk,prev_clk,posedge_t,negedge_t,dual);
  input wire clk,pre_clk;
  output reg posedge_t,negedge_t,dual;
  assign posedge_t = clk & (~prev_clk);
  assign negedge_t = ~clk & prev_clk;
  assign dual = clk ^ prev_clk;
endmodule
