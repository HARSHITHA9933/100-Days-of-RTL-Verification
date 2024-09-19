`include "design.v"
module fa_nor_tb(a,b,cin,sum,cout);
  input wire sum,cout;
  output reg a,b,cin;
  fa_nor dut(a,b,cin,sum,cout);
  initial begin
    $monitor("Time=%0t a=%0b b=%0b cin=%0b sum=%0b cout=%0b",$time,a,b,cin,sum,cout);
    #5 a=0;b=0;cin=0;
    #5 a=0;b=0;cin=1;
    #5 a=0;b=1;cin=0;
    #5 a=0;b=1;cin=1;
    #5 a=1;b=0;cin=0;
    #5 a=1;b=0;cin=1;
    #5 a=1;b=1;cin=0;
    #5 a=1;b=1;cin=1;
    #5
    $finish;
  end
endmodule
    
