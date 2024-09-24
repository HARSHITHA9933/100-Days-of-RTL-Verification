module fulladder(a,b,c,S,co);
  input wire a,b,c;
  output reg S,co;
  assign S=(a^b^c);
  assign co=((a&b)|(b&c)|(c&a));
endmodule

module mux2x1(p,q,r,t);
  input p,q,r;
  output reg t;
  assign t=((~r)&p)|(r&q);
endmodule

module carryselectadder(a,b,cin,S,co);
  input [7:0] a,b;
  input cin;
  output reg [3:0]S;
  output reg co;
wire[16:0]w;
fulladder nl(a[0],b[0],1'b0,w[0],w[1]);
fulladder n2(a[1],b[1],w[1],w[2],w[3]);
fulladder n3(a[2],b[2],w[3],w[4],w[5]);
fulladder n4(a[3],b[3],w[5],w[6],w[7]); 
fulladder n5(a[4],b[4],1'b1,w[8],w[9]);
fulladder n6(a[5],b[5],w[9],w[10],w[11]);
fulladder n7(a[6],b[6], w[11],w[12],w[13]);
fulladder n8(a[7], b[7],w[13],w[14],w[15]);

mux2x1 ml(w[0],w[8],cin,S[0]);
mux2x1 m2(w[2],w[10],cin,S[1]);
mux2x1 m3(w[4],w[12],cin,S[2]);
mux2x1 m4(w[6],w[14],cin,S[3]);
mux2x1 m5(w[7],w[15],cin,co);
endmodule
