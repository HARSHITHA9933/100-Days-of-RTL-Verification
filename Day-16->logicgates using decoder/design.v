module gatesusingdecoder(a,b,and_g,or_gate,not_gate,nor_g,nand_g,xor_g,xnor_g);
input wire a,b;
output reg and_g,or_gate,not_gate, nor_g,nand_g,xor_g,xnor_g;
wire [3:0]y;
assign y[0]=~a&~b;|
assign y[1]=~a&b;
assign y[2]=a&~b;
assign y[3]=a&b;
assign and_g=y[3];
assign or_gate=y[3]|y[2]|y[1];
assign not_gate=~a;
assign nor_g=~(y[3]|y[2]|y[1]);
assign nand_g=~(y[3]);
assign xor_g=y[1]|y[2];
assign xnor_g=y[0]|y[3];
endmodule
