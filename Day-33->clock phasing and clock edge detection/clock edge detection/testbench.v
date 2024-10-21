`include "edgedetection.v"
module edgedetection_tb(clk,prev_clk,posedge_t,negedge_t,dual);
  input wire posedge_t,negedge_t,dual;
  output reg clk,prev_clk;
  edgedetection dut(clk,prev_clk,posedge_t,negedge_t,dual);
  initial begin
    prev_clk = 0;
    forever #5 prev_clk <= ~prev_clk;
  end
 initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  initial begin
    $monitor("Time=%0t clk=%0b prev_clk=%0b posedge_t=%0b negedge_t=%0b dual=%0b",$time,clk,prev_clk,posedge_t,negedge_t,dual);
    #100;
    $finish;
  end
endmodule
