class refmodel;
    transaction wrmon_data;
    mailbox #(transaction) wr2ref;
    mailbox #(transaction) ref2scr;

    function new(mailbox #(transaction) wr2ref, mailbox #(transaction) ref2scr);
        this.wr2ref = wr2ref;
        this.ref2scr = ref2scr;
        this.wrmon_data = new();
    endfunction

    virtual task ref_logic(transaction wrmon_data);
        // On the positive edge of clk, evaluate j and k to update q and qn.
        case ({wrmon_data.j, wrmon_data.k})
            2'b00: wrmon_data.q = wrmon_data.q;  // No change
            2'b01: wrmon_data.q = 0;             // Reset
            2'b10: wrmon_data.q = 1;             // Set
            2'b11: wrmon_data.q = ~wrmon_data.q; // Toggle
        endcase
      
        wrmon_data.qn = ~wrmon_data.q;
    endtask

    virtual task start();
        forever begin
            wrmon_data = new();
            wr2ref.get(wrmon_data);
            ref_logic(wrmon_data);
            ref2scr.put(wrmon_data);
            wrmon_data.display("REF MODEL");
            //#5; // Delay for timing consistency
        end
    endtask
endclass
