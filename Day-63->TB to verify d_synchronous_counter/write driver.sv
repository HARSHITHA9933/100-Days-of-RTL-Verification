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
      // Debugging display
      $display("Time: %0t [DRV] | clk: %0b | q: %0b | qbar: %0b", $time, data2drv.clk, data2drv.q, data2drv.qbar);
      wr_drv_inf.clk <= data2drv.clk;
      wr_drv_inf.q <= data2drv.q; // Drive q
      wr_drv_inf.qbar <= data2drv.qbar; // Drive qbar
      #5;  // Small delay
    end
  endtask
endclass
