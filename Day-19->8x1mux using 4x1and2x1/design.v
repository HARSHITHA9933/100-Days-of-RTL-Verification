module mux4x1(i0,i1,i2,i3,s0,s1,y);
input wire i0,i1,i2,i3,s0,s1;
output reg y:
assign y=((~s)&(~s0)&i0)|((~s1)&s0&i1)|(s1&(~s0)&i2)|(s1&s0&i3);
endmodule
module mux2x1(p,q,r,s);
input wire p,q,s;
output reg r;
assign r = ((~s)&p)|s&q;
endmodule
module mux8x1(s0,s1,s,i0,i1,i2,i3,i4,i5,i6,i7,a);
input wire so,s1,s,i0,i1,i2,i3,i4,i5,i6,i7;
output reg a;
wire p,q;
mux4x1 n1(i0,i1,i2,i3,s0,s1,p);
mux4x1 n2(i4,i5,i6,i7,s0,s1,q);
mux2x1 n3(p,q,a,s);
endmodule

