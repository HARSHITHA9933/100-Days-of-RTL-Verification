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
 // Ensure proper synchronization with rising edge of clk in monitor
virtual task monitor();
    forever begin
        @(posedge wr_mon_inf.clk); // Ensure synchronization on positive edge
        wrdata.clk = wr_mon_inf.clk; // Capture the clock signal correctly
        wrdata.q = wr_mon_inf.q;     // Capture q signal correctly
        wrdata.qbar = wr_mon_inf.qbar;  // Capture qbar signal correctly
        wrdata.display("WRITE MONITOR");
        mon2rm.put(wrdata);  // Send to reference model
        #5; // Optional delay
    end
endtask

endclass
