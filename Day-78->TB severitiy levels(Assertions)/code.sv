module severity_levels_example;
  // Signal declarations
  logic clk, reset, signal_a, signal_b;
  // Assertions with severity levels
  // INFO: Log when signal_a goes high
  assert property (@(posedge clk) signal_a)
    else $info("INFO: signal_a went high at time %0t", $time);
  // WARNING: Warn if signal_b remains high for 3 or more cycles
  sequence signal_b_high_long;
    signal_b [*3];
  endsequence
  assert property (@(posedge clk) not signal_b_high_long)
    else $warning("WARNING: signal_b stayed high for 3 or more cycles at time %0t", $time);
  // ERROR: Ensure signal_a and signal_b are not high simultaneously
  assert property (@(posedge clk) !(signal_a && signal_b))
    else $error("ERROR: signal_a and signal_b are both high at time %0t", $time);
  // FATAL: Ensure reset deasserts correctly after 15 ns
  assert property (@(posedge clk) $rose(reset) |-> ##[1:$] !reset)
    else $fatal("FATAL ERROR: Reset did not deassert correctly at time %0t", $time);
  // Testbench
     // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  // Signal generation
  initial begin
    reset = 1;          // Reset active
    signal_a = 0;       // Both signals low initially
    signal_b = 0;
    #15 reset = 0;      // Deassert reset after 15 ns
    #25 signal_a = 1;   // Raise signal_a after 25 ns
    #50 signal_b = 1;   // Raise signal_b after 50 ns
    #75 signal_b = 0;   // Lower signal_b after 75 ns
     #100; // Run simulation for 100 ns
    $finish;
  end
endmodule
