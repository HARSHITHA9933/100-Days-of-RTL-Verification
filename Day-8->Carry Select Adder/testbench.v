`include "carryselectadder.v"
module carryselectadder_testbench(a,b,cin,S,co);
  input wire co;
  input wire [3:0]S;
  output reg [7:0]a,b;
  output reg cin;
carryselectadder inst(.a(a), .b(b), .cin(cin), S(S), .co(co));
initial begin
  $monitor("Time =%t a=%4b b=%4b cin=%4b S=%4b co=%4b", $time,a,b,co,S,co);
  cin=1'b0;
  a = 4'b0110;
  b= 4'b0110;
  #10;
  a=4'b1110;
  b=4'b0111;
  #10;
  a=4'b0010;
  b=4'b1001;
  #10;
  $finish;
end
endmodule
