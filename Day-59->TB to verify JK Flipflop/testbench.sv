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

  // Instantiate the interface
  intf duv_if();

  // Testbench and DUT instantiation
  test test_h;
  jk_ff dut (
    .clk(duv_if.clk),
    .reset(duv_if.reset),
    .j(duv_if.j),
    .k(duv_if.k),
    .q(duv_if.q),
    .qn(duv_if.qn)
  );

  // Clock generation through interface
  initial begin
    duv_if.clk = 0;
    forever #5 duv_if.clk = ~duv_if.clk;
  end

  // Reset generation through interface
  initial begin
    duv_if.reset = 1;
    #15 duv_if.reset = 0;
  end

  // Testbench initialization
  initial begin
    test_h = new(duv_if, duv_if, duv_if); // Pass interface to test
    test_h.build_run();
    #200;
    $finish;
  end

endmodule

               
