class test;
  virtual intf.WR_DRV_MP wr_drv_inf;
    virtual intf.WR_MON_MP wr_mon_inf;
    virtual intf.RD_MON_MP rd_mon_inf;
  environment env;
  function new( virtual intf.WR_DRV_MP wr_drv_inf,
    virtual intf.WR_MON_MP wr_mon_inf,
    virtual intf.RD_MON_MP rd_mon_inf);
     this.wr_drv_inf=wr_drv_inf;
    this.wr_mon_inf=wr_mon_inf;
    this.rd_mon_inf=rd_mon_inf;
  env=new(wr_drv_inf,wr_mon_inf,rd_mon_inf);
  endfunction
  virtual task build_run();
    env.build();
    //env.run();*/
    env.start();
  endtask
endclass
  
