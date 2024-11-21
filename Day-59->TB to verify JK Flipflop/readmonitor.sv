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
      @(posedge rd_mon_inf.clk);
      rddata.q = rd_mon_inf.q;  
      rddata.qn=rd_mon_inf.qn;
    rddata.display("DATA FROM READ MONITOR");
     rdmon2sc.put(rddata);
     // #5;
    end
  endtask
endclass
    
