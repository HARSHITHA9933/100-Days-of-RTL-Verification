class monitor;
  virtual intf.WR_MON_MP wr_mon_inf;
  transaction wrdata;
  mailbox #(transaction) mon2rm;

  function new(virtual intf.WR_MON_MP wr_mon_inf, mailbox #(transaction) mon2rm);
    this.wr_mon_inf = wr_mon_inf;
    this.mon2rm = mon2rm;
    this.wrdata = new();
  endfunction

  // Monitor task to capture data correctly
  virtual task monitor();
    forever begin
      @(posedge wr_mon_inf.clk); // Wait for rising edge of clock to capture data
      wrdata.clk = wr_mon_inf.clk; // Capture the clock signal
      wrdata.d = wr_mon_inf.d; // Capture the data signal
      wrdata.display("WRITE MONITOR"); // Display captured data for debug
      mon2rm.put(wrdata); // Send data to reference model
      #5; // Optional small delay to ensure propagation
    end
  endtask
endclass

