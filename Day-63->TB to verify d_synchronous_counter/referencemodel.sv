class refmodel;
  mailbox #(transaction) wrm2ref;
  mailbox #(transaction) ref2sc;
  transaction ref_tr;
  
  function new(mailbox #(transaction) wrm2ref, mailbox #(transaction) ref2sc);
    this.wrm2ref = wrm2ref;
    this.ref2sc = ref2sc;
    this.ref_tr = new();
  endfunction

  virtual task start();
    forever begin
      wrm2ref.get(ref_tr);  // Get data from the driver
      // Check the expected values here
      if (ref_tr.q !== ref_tr.qbar) begin
        $display("REF MODEL MISMATCH: Expected = %b, Received = %b", ref_tr.q, ref_tr.qbar);
      end else begin
        $display("REF MODEL MATCH SUCCESS: Expected = %b, Received = %b", ref_tr.q, ref_tr.qbar);
      end
      ref2sc.put(ref_tr);  // Send to scoreboard
    end
  endtask
endclass
