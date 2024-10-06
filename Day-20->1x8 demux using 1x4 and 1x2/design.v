
module demux1x4(d,s0,s1,i0,i1,i2,i3);
    input d,s0,s1;
    output i0,i1,i2,i3;
    assign i0=(d&~s0&~s1);
    assign i1=(d&s0&~s1);
    assign i2=(d&~s0&s1);
    assign i3=(d&s0&s1);
endmodule

module demux1x2(d,s,y0,y1);
input d,s;
output y0,y1;
assign y0=d&~s;
assign y1=d&s;
endmodule

module demux1x8(d,s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7);
input d,s0,s1,s2;
output i0,i1,i2,i3,i4,i5,i6,i7 ;
wire p,q;
demux1x2 n1(d,s0,p,q);
demux1x4 n2(p,s2,s1,i0,i1,i2,i3);
demux1x4 n3(q,s2,s1,i4,i5,i6,i7);
endmodule


