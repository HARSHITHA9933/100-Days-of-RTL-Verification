class rdmonitor;
  virtual intf.RD_MON_MP rd_mon_inf;
  transaction rddata;//data2scr;
  mailbox #(transaction) rdmon2sc;
  function new(virtual intf.RD_MON_MP rd_mon_inf, mailbox #(transaction) rdmon2sc);
    this.rd_mon_inf = rd_mon_inf;
    this.rdmon2sc = rdmon2sc;
    this.rddata = new();
  endfunction
  virtual task monitor();
    forever begin
 #5;
      rddata.y1 = rd_mon_inf.y1;
      rddata.y2 = rd_mon_inf.y2;
      rddata.y3 =rd_mon_inf.y3;
      rddata.y4 =rd_mon_inf.y4;
    rddata.display("DATA FROM READ MONITOR");
     rdmon2sc.put(rddata);
    end
  endtask
endclass
    
