class monitor;
  virtual intf.WR_MON_MP wr_mon_inf;
  transaction  wrdata;//data2rm;
  mailbox #(transaction)mon2rm;
  function new(virtual intf.WR_MON_MP wr_mon_inf, mailbox #(transaction)mon2rm);
    this.wr_mon_inf=wr_mon_inf;
    this.mon2rm=mon2rm;
    this.wrdata=new();
  endfunction
  virtual task monitor();
    forever begin
      #5;
        wrdata.bcd = wr_mon_inf.bcd;
    wrdata.display("DATA FROM WRITE MONITOR");
     mon2rm.put(wrdata);
    end
  endtask
endclass
