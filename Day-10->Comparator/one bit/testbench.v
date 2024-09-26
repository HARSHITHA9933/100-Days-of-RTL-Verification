`include "comp.v"
module comp_test(a,b,x,y,z);
 input wire x,y;
 output reg a,b;
comp inst(.a(a), .b(b), x(x), y(y), .z(2));
initial begin 
  $monitor("Time=%0t a=%0b b=%0b x=%0b y=%0b", $time,a,b,x,y,z); 
#10 x=0;y=0;
  #10 x=0;y=1;
  #10 x=1;y=0;
  #10 x=1;y=1;
  #10;
  $finish;
end
endmodule

