`include "half_sub.v"
module half_sub_test(d0,b0,a,b);
output reg a,b;
input wire d0,b0;
  half_sub inst(.d0 (d0), b0(b0), .a(a), .b(b));
  initial begin
    $monitor("Time=%0 => a=%b b=%b difference=%b borrow=%b",$time,a,b,d0,b0);
      #1 a=0;b=0;
      #1 a=0;b=1;
      #1 a=1;b=0;
      #1 a=1;b=1;
      #1
      $finish;
    end
endmodule
