
interface intf;
  logic clk;
  logic d;
  logic [3:0] q;

  modport WR_DRV_MP (output d,clk);
  modport WR_MON_MP (input d, clk);
  modport RD_MON_MP (input q, clk);
endinterface
