`include "carrylook.v"
module carrylook_testbench(a, b, cin, S, Cout);
input wire [3:0]S;input wire Cout;
output reg [3:0]a,b; output reg cin;
carrylook inst(.a(a), b(b), .cin(cin), S(S), Cout(Cout));
initial begin
  monitor ("CE=Time=%t a=%b b=%b cin=%b S=%b Cout=%b", $time, a, b, cin, S, Cout); 
  a = 4'b0001; b = 4'b0011; cin =1'b0;
  #10;
  a = 4'b0011; b = 4'b1100; 
  #10; 
  a = 4'b1001; b = 4'b1001;
  #10;
  $finish;
end
endmodule
