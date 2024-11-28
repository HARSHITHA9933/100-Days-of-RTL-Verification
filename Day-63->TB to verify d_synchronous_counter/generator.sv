class generator;
  transaction gen_tr;
  mailbox #(transaction) gen2wr;
  logic [3:0] q_gen, qbar_gen; // Added q and qbar for tracking in generator

  function new(mailbox #(transaction) gen2wr);
    this.gen2wr = gen2wr;
    this.gen_tr = new();
  endfunction

  virtual task start();
    fork
      repeat (5) begin
        // Randomize both q and qbar
        gen_tr.q = $random;
        gen_tr.qbar = ~gen_tr.q;
        gen2wr.put(gen_tr);  // Send data to write driver
        gen_tr.display("GEN");
        #10;  // Wait for 10 time units before generating new data
      end
    join_none
  endtask
endclass
