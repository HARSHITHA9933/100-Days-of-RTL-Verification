module logicgates_using_mux(input wire a,b, output reg y1,y2,y3,y4,y5,y6);
  mux_2x1 and_gate(1'b0,b,a,y1);
  mux_2x1 nand_gate(1'b1,~b,a,y2);
  mux_2x1 or_gate(b,l'b1,a,y3);
  mux_2x1 nor_gate(~b,1'b0,a,y4);
  mux_2x1 xor_gate(b,~b,a,y5);
  mux_2x1 xnor_gate(~b,b,a,уб);
endmodule
module mux_2x1(input wire a,b,sel, output reg y);
  assign y=(a&~sel)|(b&sel);
endmodule
