`include "design.sv"
`include "interface.sv"
`include "transaction.sv"
`include"generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
module tb;  
  dff_if vif();
   dff dut (vif);
    initial begin
      vif.clk <= 0;
    end
    always #10 vif.clk <= ~vif.clk;
    environment env; 
    initial begin
      env = new(vif);
      env.gen.count = 30;
      env.run();
    end   
  endmodule
