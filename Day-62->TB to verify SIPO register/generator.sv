class generator;
  transaction gen_tr;
  mailbox #(transaction) gen2wr;

  function new(mailbox #(transaction) gen2wr);
    this.gen2wr = gen2wr;
    this.gen_tr = new();
  endfunction

  virtual task start();
    fork
      repeat (5) begin
        assert(gen_tr.randomize());  // Randomize the data
        gen2wr.put(gen_tr);  // Send data to write driver
        gen_tr.display("GEN");  // Display the generated data
        #10;  // Wait for 10 time units before generating new data
      end
    join_none
  endtask
endclass
