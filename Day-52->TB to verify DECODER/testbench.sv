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
  decoder dut(.a(duv_if.a), .b(duv_if.b), .y1(duv_if.y1), .y2(duv_if.y2), .y3(duv_if.y3), .y4(duv_if.y4));
  initial begin
    test_h=new(duv_if,duv_if,duv_if);
    test_h.build_run();
    #100;
    $finish;
  end
endmodule
