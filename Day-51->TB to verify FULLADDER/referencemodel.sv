class refmodel;
  transaction wrmon_data;
  mailbox #(transaction) wr2ref;
  mailbox #(transaction) ref2scr;​
  function new (mailbox #(transaction)wr2ref, mailbox # (transaction) ref2scr);
    this.wr2ref=wr2ref;
    this.ref2scr=ref2scr;
  endfunction
  virtual task ref_logic(transaction wrmon_data);
    wrmon_data.sum=wrmon_data.a^wrmon_data.b^wrmon_data.c;
    wrmon_data.carry=(wrmon_data.a & wrmon_data.b)|(wrmon_data.b & wrmon_data.c)|(wrmon_data.c & wrmon_data.a);
  endtask    
  virtual task start();
      forever 
        begin
        wrmon_data=new();
        wr2ref.get(wrmon_data);
          ref_logic(wrmon_data);
          ref2scr.put(wrmon_data);
          wrmon_data.display("refmodell");
        end
  endtask
endclass
