class rdmonitor;
  virtual intf.RD_MON_MP rd_mon_inf;
  transaction rddata;                   
  mailbox #(transaction) rdmon2sc;      

  function new(virtual intf.RD_MON_MP rd_mon_inf, mailbox #(transaction) rdmon2sc);
    this.rd_mon_inf = rd_mon_inf;
    this.rdmon2sc = rdmon2sc;
    this.rddata = new();
  endfunction

  virtual task monitor();
    forever begin
      @(posedge rd_mon_inf.clk); // Wait for the clock's rising edge
      rddata.q = rd_mon_inf.q;    // Capture q
      rddata.qbar = rd_mon_inf.qbar;  // Capture qbar
      rddata.display("DATA FROM READ MONITOR");

      rdmon2sc.put(rddata);  // Send data to the scoreboard
    end
  endtask
endclass
