`include "design.v"
module multiplier_4bit_tb;
reg [3:0]a,b;
wire [7:0]p;
multiplier 4bit inst(.a(a), .b(b), .p(p));
initial begin
$monitor("Time=%0t a=%b b=%b product=%ed", $time,a,b,p);
 a = 4'b0000 ; b = 4'b0000 ;
 #10 a = 4'b0001; b = 4'b0010;
 #10 a = 4'b0011 ;b=4'b0011;
  #10 a = 4'b0100 ; b = 4'b0010;
  #10;
  $finish;
end
endmodule
