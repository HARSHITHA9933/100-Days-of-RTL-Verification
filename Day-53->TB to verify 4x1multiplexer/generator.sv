class generator;
  transaction gen_tr;
  mailbox #(transaction) gen2wr;
  function new(mailbox #(transaction) gen2wr);
    this.gen2wr=gen2wr;
    this.gen_tr=new();
  endfunction

  virtual task start();
    fork
      begin
        repeat (5) begin
          assert(gen_tr.randomize());
          gen2wr.put(gen_tr);
         gen_tr.display("GEN");
          #5;
        end
      end
    join_none
  endtask
endclass
