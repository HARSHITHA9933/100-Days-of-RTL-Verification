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
            @(posedge wr_drv_inf.clk); // Wait for the clock edge before updating
            gen2wr.get(data2drv);
            wr_drv_inf.j <= data2drv.j;
            wr_drv_inf.k <= data2drv.k;
            data2drv.display("DRV");
            //#5; // Driver delay
        end
    endtask
endclass
