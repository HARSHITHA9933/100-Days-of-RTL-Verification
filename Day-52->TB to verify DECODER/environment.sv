class environment;
  virtual intf.WR_DRV_MP wr_drv_inf;
    virtual intf.WR_MON_MP wr_mon_inf;
    virtual intf.RD_MON_MP rd_mon_inf;
mailbox #(transaction)gen2wr=new();
  mailbox #(transaction)wrm2ref=new();
 mailbox #(transaction)rdm2sc=new();
mailbox #(transaction )ref2sc=new();
  generator gen;
  driver drv;
  monitor mon;
  rdmonitor rdmon;
  refmodel refmode;
  scoreboard score;
  function new( virtual intf.WR_DRV_MP wr_drv_inf,
    virtual intf.WR_MON_MP wr_mon_inf,
    virtual intf.RD_MON_MP rd_mon_inf);
     this.wr_drv_inf=wr_drv_inf;
    this.wr_mon_inf=wr_mon_inf;
    this.rd_mon_inf=rd_mon_inf;
  endfunction
virtual task build;
    gen=new(gen2wr);
   drv=new(wr_drv_inf,gen2wr);
    mon=new(wr_mon_inf,wrm2ref);
   rdmon=new(rd_mon_inf,rdm2sc);
   refmode=new(wrm2ref,ref2sc);
  score=new(ref2sc,rdm2sc);
endtask
virtual task start();
  fork
  gen.start();
drv.drive();
mon.monitor();
rdmon.monitor();
refmode.start();
score.start();
  join_none
endtask
endclass
