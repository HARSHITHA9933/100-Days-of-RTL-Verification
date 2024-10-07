`include "jkff.v"
module jkff_test(clk,j,k,q);
  input wire q;
  output reg clk,j,k;
  jkff inst(.clk(clk), .j(j), .k(k), .q(q));
  initial begin
    $monitor("Time=%t clk=5b j=%b k=5b q=%b",$time,clk,j,k,q);
    clk=0;
    forever #10 clk=~clk;
  end
  initial begin
    #10 j=0;k=0;
    #10 j=0;k=1;
    #10 j=1;k=0;
    #10 j=1;k=1;
    #20
    $finish;
  end
endmodule
  
