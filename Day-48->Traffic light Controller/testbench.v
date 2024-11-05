`include "traffic_light_controller.v"
module traffic_light_controller_test();
  reg clk,rst;
  wire [3:0] r,g;
  traffic_light_controller inst(clk,rst,r,g);
  always #5 clk=~clk;
  initial begin
    clk<=0;
    rst<=1;
    #10;
    rst<=0;
    #20000;
    $finish;
  end
endmodule
