`include "gatesusingdecoder.v"
module gateusingdecoder_tb(a,b,and_g,or_gate,not_gate,nor_g,nand_g,xor_g,xnor_g);
output reg a,b;
input wire and_g,or_gate,not_gate,nor_g,nand_g,xor_g,xnor_g;
gatesusingdecoder dut(.a(a), .b(b), .and_g(and_g), .or_gate(or_gate), .not_gate(not_gate), .nor_g(nor_g), .nand_g(nand_g), .xor_g(xor_g), .xnor_g(xnor_g));
initial begin
  $monitor("CE=Time=%0t a=%b b=%b and_g=%b or_g=%b not_gate=%b nor_g=%b nand_g=%b xor_g=%b xnor_g=%b", $time,a,b,and_g,or_gate,not_gate,nor_g,nand_g,xor_g,xnor_g);
#1 a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
#10;
  $finish;
 end
endmodule
