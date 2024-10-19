`include "johnson_counter.v"
module johnson_counter_test(q,qbar,clk,reset);
  input wire[3:0] q,qbar;
  output reg clk,reset;
  johnson_counter inst(q,qbar,clk,reset);
  always #10 clk=~clk;
  initial begin
    $monitor("Time=%0t=>q=%04b",$time,q);
    clk=0;
    #10 reset=1;
    #20 reset=0;
    #350;
    $finish;
  end
endmodule
