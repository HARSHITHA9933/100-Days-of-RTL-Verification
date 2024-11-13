interface intf(); 
  logic a;
  logic b;
  logic c;
  logic d;
  logic s1;
  logic s2;
  logic y;
  
  modport WR_DRV_MP (output a,b,c,d,s1,s2);
  modport WR_MON_MP (input a,b,c,d,s1,s2);
  modport RD_MON_MP ( input y);
endinterface
