`include "gatesusingencoder.v"
module gateusingencoder_tb(i,and_g,or_g,not_g,nor_g,nand_g,xor_g,xnor_g);
output reg [3:0]i;
input wire and_g,or_g,not_g,nor_g,nand_g,xor_g,xnor_g;
gatesusingencoder dut(.i(i), .and_g(and_g), .or_g(or_g), .not_g(not_g), .nor_g(nor_g), .nand_g(nand_g), .xor_g(xor_g), .xnor_g(xnor_g));
initial begin
$monitor("CE=Time=%0t i=%b and_g=%b or_g=%b not_g=%b nor_g=%b nand_g=%b xor_g=%b xnor_g=%b",$time,i,and_g,or_g,not_g,nor_g,nand_g,xor_g,xnor_g);
#1 i=4'b0001;
#1 i=4'b0010;
#1 i=4'b0100;
#1 i=4'b1000;
#1;
$finish;
end
endmodule
