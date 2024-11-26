`include "design.sv"
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "wr_driver.sv"
`include "wr_monitor.sv"
`include "rd_monitor.sv"
`include "ref_model.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;

  // Interface for signals
  intf duv_if();

  // Instantiate the test and the DUT (SIPO)
  test test_h;
  sipo_reg dut (
    .q(duv_if.q), 
    .clk(duv_if.clk), 
    .d(duv_if.d)
  );

  // Clock generation
  initial begin
    duv_if.clk = 0;
    forever #5 duv_if.clk = ~duv_if.clk; // Clock period of 10
  end

  // Testbench initialization
  initial begin
    test_h = new(duv_if, duv_if, duv_if); // Instantiate testbench
    test_h.build_run();
    #200; // Run for 200 time units
    $finish; // End the simulation
  end
endmodule

