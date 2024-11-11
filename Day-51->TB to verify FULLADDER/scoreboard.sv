class scoreboard;
  transaction rm_data, rcvdata;
  mailbox #(transaction) ref2scr;
  mailbox #(transaction) rdmon2sc;

  function new(mailbox #(transaction) ref2scr, mailbox #(transaction) rdmon2sc);
    this.ref2scr = ref2scr;
    this.rdmon2sc = rdmon2sc;
  endfunction
  virtual task start();
      forever begin
        rm_data=new();
        ref2scr.get(rm_data);
        rcvdata=new();
        rdmon2sc.get(rcvdata);
        check(rcvdata);
      end
  endtask
  virtual task check(transaction rc_data);
    if (rm_data.sum == rc_data.sum && rm_data.carry == rc_data.carry)
          $display("ok");
        else
          $display("not ok");
  endtask
endclass
