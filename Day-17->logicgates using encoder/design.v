module gatesusingencoder(i,and_g,or_g,not_g,nand_g,nor_g,xor_g,xnor_g);
input wire [3:0]i;
output reg and_g,or_g,not_g,nand_g,nor_g,xor_g,xnor_g;
wire y0,y1;
assign y0=i[3]|i[2];//i[3]=a&b; i[2]=a&~b;i[1]=~a&b;i[0]=~a&~b;
assign yl=i[1]|1[3];
assign and_g=y0&y1;
assign or_g=y0|y1;
assign not_g=~y0;
assign nand_g=~(y0&y1);
assign nor_g=~(y0|y1);
assign xor_g=y0^y1;
assign xnor_g=~(y0^y1);
endmodule
