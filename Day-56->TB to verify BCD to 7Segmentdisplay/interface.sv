interface intf(); 
  logic [3:0] bcd;
  logic [6:0]seg;
  modport WR_DRV_MP (output bcd);
  modport WR_MON_MP (input bcd);
  modport RD_MON_MP ( input seg);
endinterface
