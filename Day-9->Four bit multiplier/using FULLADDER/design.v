module fulladder (a, b, c, S, co);
  input wire a,b,c;
  output reg S,co;
  assign S=(a^b^c);
  assign co=((a&b)|(b&c)|(c&a));
endmodule
module multiplier(x,y,o);
  input [3:0] x,y;
  output reg [7:0] o;
  wire al, a2, a3, a4, b1,b2, b3, b4, c1, c2, c3, c4, d1, d2 d3, d4;
  wire [11:0]out;
  wire r1, r2, г3, г4, г5, гб, г7, г8, г9, г10, г11, r12;
  assign al = x[0]&y[0];
  assign a2 = x[1]&y[0];
  assign a3 = x[2]&y[0];
  assign a4 = x[3]&y[0];
  assign b1 = x[0]&y[1];
  assign b2 = x[1]&y[1];
  assign b3 = x[2]&y[1];
  assign b4 = x[3]&y[1];
  assign c1 = x[0]&y[2]:
  assign c2 = x[1]&y[2]:
  assign c3 = x[2]&y[2];
  assign c4 = x[3]&y[2];
  assign d1 = x[01&y[3]:
  assign d2 = x[1]&y[3];
  assign d3 = x[2]&y[3];
  assign d4 = x[3]&y[3]:
  fulladder wl(a2,b1,1'b0, out[0],r1);
  fulladder w2(a3,b2,r1,out [1],r2);
  fulladder w3(a4,b3,r2,out [2],r3);
  fulladder w4(1'b0,b4,r3,out[3],r4);
  fulladder w5(out[1],c1,1'b0,out[4],r5);
  fulladder w6(out[2],c2,r5,out [5],г6); 
  fulladder w7(out[3],c3,r6,out[6],r7);
  fulladder w8(r4,c4,r7,out[7],r8);
  fulladder w9(out[5],d1,1'b0,out[8],r9);
  fulladder w10(out[6],d2,r9,out[9],r10);
  fulladder wll(out[7],d3,r10,out[10],r11);
  fulladder w12(r8,d4,r11,out[11],12);
  assign o[0]=al;
  assign o[1]=out[0];
  assign o[2]=out[4];
  assign o[3]=out[8]:
  assign o[4]=out[9];
  assign o[15]=out[10];
  assign o[16]=out[11];
  assign o[7]=r12;
endmodule
