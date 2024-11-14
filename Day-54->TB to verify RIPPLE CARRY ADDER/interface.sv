interface intf(); 
  logic [3:0]a;
  logic[3:0] b;
  logic cin;
  logic [3:0]sum;
  logic carryout;
  
  modport WR_DRV_MP (output a,b,cin);
  modport WR_MON_MP (input a,b,cin);
  modport RD_MON_MP ( input sum,carryout);
endinterface
