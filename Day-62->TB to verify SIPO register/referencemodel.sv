class refmodel;
  transaction wrmon_data;
  mailbox #(transaction) wr2ref, ref2scr;
  reg [3:0] q_internal;

  function new(mailbox #(transaction) wr2ref, mailbox #(transaction) ref2scr);
    this.wr2ref = wr2ref;
    this.ref2scr = ref2scr;
    q_internal = 4'b0000; // Initialize shift register to 0
  endfunction

  // Shift logic for SIPO behavior
  virtual task ref_logic(transaction wrmon_data);
    q_internal = {q_internal[2:0], wrmon_data.d}; // Shift left and insert new data
    wrmon_data.q = q_internal; // Update the transaction data with the shifted value
  endtask

  virtual task start();
    forever begin
      wrmon_data = new();
      wr2ref.get(wrmon_data); // Get data from write monitor
      ref_logic(wrmon_data); // Apply shift register logic
      wrmon_data.display("REF MODEL"); // Display reference model data
      ref2scr.put(wrmon_data); // Send to scoreboard for comparison
    end
  endtask
endclass

