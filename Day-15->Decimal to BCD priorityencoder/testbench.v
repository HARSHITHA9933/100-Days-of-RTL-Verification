`include "design.v"
module tb;
wire a,b,c,e;
reg [1:9]d;
 decimal_bcd inst(.a(a), .b(b), .c(c), .e(e), .d(d));
initial begin
  $monitor("d=%b e=%b c=%b b=%b a=%b",d,e,c,b,a);
d=9'b100000000;
#10 d=9'bx10000000;
#10 d=9'bxx1000000;
#10 d=9'bxxx100000;
#10 d=9'bxxxx10000;
#10 d=9'bxxxxx1000;
#10 d=9'bxxxxxx100;
#10 d=9'bxxxxxxx10;
#10 d=9'bxxxxxxxx1;
#10
 $finish;
end
endmodule
