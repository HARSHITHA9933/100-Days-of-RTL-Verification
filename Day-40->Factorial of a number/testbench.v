`include "factorial.v"
module factorial_test;
  reg [3:0]n;
  wire [7:0]result;
  integer x;
  factorial inst(n,result);
  always for(x=0;x<=5;x=x+1)
    #10 n=x;
  initial begin
    $monitor("Time=%ot factorial of %d id %d",$time,n,result);
    #70;
    $finish;
  end
endmodule
