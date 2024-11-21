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
        //#5;
      end
  endtask
  virtual task check(transaction rc_data);
    if ((rm_data.q== rc_data.q)&&(rm_data.qn== rc_data.qn))
      $display("compared sucessfully");
        else
          $display("not compared");
  endtask

endclass
