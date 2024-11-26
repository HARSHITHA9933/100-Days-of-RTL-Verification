class driver;
  virtual intf.WR_DRV_MP wr_drv_inf;
  transaction data2drv;
  mailbox #(transaction) gen2wr;

  function new(virtual intf.WR_DRV_MP wr_drv_inf, mailbox #(transaction) gen2wr);
    this.wr_drv_inf = wr_drv_inf;
    this.gen2wr = gen2wr;
  endfunction

  virtual task drive();
    forever begin
      gen2wr.get(data2drv); // Get data from generator
      wr_drv_inf.d <= data2drv.d; // Drive the data
      wr_drv_inf.clk <= data2drv.clk; // Align the clock
      data2drv.display("DRV"); // Display the data being driven
      #5; // Small delay to allow propagation
    end
  endtask
endclass

