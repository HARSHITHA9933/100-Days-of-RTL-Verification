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
    if ((rm_data.sum== rc_data.sum)&&(rm_data.carryout== rc_data.carryout))
      $display("compared sucessfully");
        else
          $display("not compared");
  endtask

endclass
