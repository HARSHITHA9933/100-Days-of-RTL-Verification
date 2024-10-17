`include "d_asynchronous_counter.v"
module d_asynchronous_counter_test;
  wire[3:0]q,qbar;
  reg clk;
  d_asynchronous_counter inst(.clk(clk), .q(q), .qbar(qbar));
  always #10 clk=~clk;
  initial begin
    $monitor("Time=%0t=>q=%d qbar=%d",$time,q,qbar);
    clk=0;
    #10;
    #250;
    $finish;
  end
endmodule
