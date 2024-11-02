`include "polindrome.v"
module polindrome_tb(data, out);
output reg [7:0] data;
input wire out;
polindrome dut (data, out);
initial begin
$monitor("Time=%0t data=%0b out=%0b ",$time, data, out);
data=8'b00110011;
#10
data=8'b01100110;
#10
data=8'b10011001;
#10
data=8'b10101011;
#10
data=8'b11111111;
#10;
$finish;
end
endmodule
