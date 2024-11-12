class refmodel;
  transaction wrmon_data;
  mailbox #(transaction) wr2ref;
  mailbox #(transaction) ref2scr;
  function new (mailbox #(transaction)wr2ref, mailbox # (transaction) ref2scr);
    this.wr2ref=wr2ref;
    this.ref2scr=ref2scr;
  endfunction
  virtual task ref_logic(transaction wrmon_data);
    wrmon_data.y1=~(wrmon_data.a)&~(wrmon_data.b);
    wrmon_data.y2=~(wrmon_data.a)&(wrmon_data.b);
    wrmon_data.y3=(wrmon_data.a)&~(wrmon_data.b);
    wrmon_data.y4=(wrmon_data.a)&(wrmon_data.b);
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
