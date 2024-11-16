class refmodel;
  transaction wrmon_data;
  mailbox #(transaction) wr2ref;
  mailbox #(transaction) ref2scr;

  // Constructor
  function new (mailbox #(transaction) wr2ref, mailbox #(transaction) ref2scr);
    this.wr2ref = wr2ref;
    this.ref2scr = ref2scr;
  endfunction

  // Function for a 2-to-1 multiplexer
  function bit mux(bit a, bit b, bit sel);
    return (a & ~sel) | (b & sel);
  endfunction

  // Task for the reference logic
  virtual task ref_logic(transaction wrmon_data);
    bit and_gate, nand_gate, or_gate, nor_gate, xor_gate, xnor_gate;

    // Perform logic operations using the multiplexer function
    and_gate = mux(1'b0, wrmon_data.b, wrmon_data.a);
    nand_gate = mux(1'b1, ~wrmon_data.b, wrmon_data.a);
    or_gate = mux(wrmon_data.b, 1'b1, wrmon_data.a);
    nor_gate = mux(~wrmon_data.b, 1'b0, wrmon_data.a);
    xor_gate = mux(wrmon_data.b, ~wrmon_data.b, wrmon_data.a);
    xnor_gate = mux(~wrmon_data.b, wrmon_data.b, wrmon_data.a);

    // Assign the results back to the transaction
    wrmon_data.y1 = and_gate;
    wrmon_data.y2 = nand_gate;
    wrmon_data.y3 = or_gate;
    wrmon_data.y4 = nor_gate;
    wrmon_data.y5 = xor_gate;
    wrmon_data.y6 = xnor_gate;
  endtask

  // Task to start processing
  virtual task start();
    forever begin
      wrmon_data = new();
      wr2ref.get(wrmon_data);
      ref_logic(wrmon_data);
      ref2scr.put(wrmon_data);
      wrmon_data.display("refmodel");
    end
  endtask

endclass

