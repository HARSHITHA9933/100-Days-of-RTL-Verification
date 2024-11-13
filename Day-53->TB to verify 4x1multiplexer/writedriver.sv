class driver;
  virtual intf.WR_DRV_MP wr_drv_inf;
  transaction data2drv;
  mailbox #(transaction)gen2wr;
  function new(virtual intf.WR_DRV_MP  wr_drv_inf, mailbox #(transaction)gen2wr);
    this.wr_drv_inf = wr_drv_inf;
    this.gen2wr = gen2wr;
  endfunction
  virtual task drive();
    forever begin
    gen2wr.get(data2drv);
     wr_drv_inf.a <= data2drv.a;
       wr_drv_inf.b <= data2drv.b;
       wr_drv_inf.c <= data2drv.c;
      wr_drv_inf.d <= data2drv.d;
      wr_drv_inf.s1 <=data2drv.s1;
      wr_drv_inf.s2<=data2drv.s2;
        data2drv.display("DRV");
    end
  endtask
endclass

