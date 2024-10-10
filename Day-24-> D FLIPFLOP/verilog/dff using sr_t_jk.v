`include "sr_flipflop.v"
`include "jk_flipflop.v"
`include "t_flipflop.v"
module dff_using_sr_jk_t(input clk, reset, d, output q_sr,q_jk,q_t );
  wire w;
  sr_flipflop sr(clk, reset, d, ~d, q_sr);
  jk_flipflop jk(d, ~d, clk, reset, q_jk);
  assign w= d^q_t;
  t_flipflop t(w,clk,reset,q_t);  
endmodule
