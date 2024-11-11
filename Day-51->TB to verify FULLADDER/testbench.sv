`include "design.sv"
`include "interface.sv"
`include "Transaction.sv"
`include "generator.sv"
`include "wr_driver.sv"
`include "wr_mon.sv"
`include "rd_mon.sv"
`include "ref_model.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"
module top;
  intf duv_if();
  test test_h;
  fadesign dut(.a(duv_if.a), .b(duv_if.b), .c(duv_if.c), .sum(duv_if.sum), .carry(duv_if.carry));
  initial begin
    test_h=new(duv_if,duv_if,duv_if);
    test_h.build_run();
    #100;
    $finish;
  end
endmodule
  
               

