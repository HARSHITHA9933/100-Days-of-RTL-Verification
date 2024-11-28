class scoreboard;
  transaction rm_data, rcvdata;
  mailbox #(transaction) ref2scr, rdmon2sc;

  function new(mailbox #(transaction) ref2scr, mailbox #(transaction) rdmon2sc);
    this.ref2scr = ref2scr;
    this.rdmon2sc = rdmon2sc;
  endfunction

  virtual task start();
    forever begin
      ref2scr.get(rm_data); // Get expected data from reference model
      rdmon2sc.get(rcvdata); // Get actual data from read monitor
      check(rcvdata); // Compare the data
    end
  endtask

  virtual task check(transaction rc_data);
    if (rm_data.q === rc_data.q)
      $display("MATCH SUCCESS: Expected = %b, Received = %b", rm_data.q, rc_data.q);
    else
      $display("MISMATCH: Expected = %b, Received = %b", rm_data.q, rc_data.q);
  endtask
endclass
