`include "multiplier.v"
module multiplier_test(x,y,o);
input wire [7:0] o;
output reg [3:0] x;
output reg [3:0] y;
multiplier dut(x,y,o);
initial begin
  $monitor("Time=%0t x=%4b y=%4b o=%8b", $time,x,y,o);
  #5  x = 4'b0010; y = 4'b0011;
  #10 x = 4'b1111; y = 4'b0101;
  #10 x = 4'b1100; y = 4'b0010;
  #200
  $finish;
end
endmodule
