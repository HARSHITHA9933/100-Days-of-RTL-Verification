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
       wr_drv_inf.bcd <= data2drv.bcd;
        data2drv.display("DRV");
    end
  endtask
endclass
