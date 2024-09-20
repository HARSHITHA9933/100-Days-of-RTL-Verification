`include "half_nand.v"
module half_nand_test(differ,borrow,a,b);
output reg a,b;
input wire differ,borrow;
  half_nand inst(.differ(differ), borrow(borrow), .a(a), .b(b));
  initial begin
    $monitor("Time=%0t => a=%b b=%b difference=%b borrow=%b",$time,a,b,differ,borrow);
      #1 a=0;b=0;
      #1 a=0;b=1;
      #1 a=1;b=0;
      #1 a=1;b=1;
      #1
      $finish;
    end
endmodule
