class monitor;
    virtual intf.WR_MON_MP wr_mon_inf;
    transaction wrdata;
    mailbox #(transaction) mon2rm;

    function new(virtual intf.WR_MON_MP wr_mon_inf, mailbox #(transaction) mon2rm);
        this.wr_mon_inf = wr_mon_inf;
        this.mon2rm = mon2rm;
        this.wrdata = new();
    endfunction

    virtual task monitor();
        forever begin
         // #5;
            @(posedge wr_mon_inf.clk); // Synchronize with the positive edge of clk
       
            wrdata.j = wr_mon_inf.j;
            wrdata.k = wr_mon_inf.k;
            wrdata.display("WRITE MONITOR");
            mon2rm.put(wrdata);
          //#5; // Monitor delay
        end
    endtask
endclass
