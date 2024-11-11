interface intf(); 
  logic a;
  logic b;
  logic c;
  logic sum;
  logic carry;
  
  modport WR_DRV_MP (output a,b,c);
  modport WR_MON_MP (input a,b,c);
  modport RD_MON_MP ( input sum,carry);
endinterface
