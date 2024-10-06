module demux1x8_tb();
wire i0,i1,i2,i3,i4,i5,i6,i7;
reg d,s0,s1,s2;
demux1x8 inst(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .s0(s0), .s1(s1), .s2(s2), .d(d));
initial begin
$monitor("Time=%t  d=%b s0=%b s1=%b s2=%b  i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b",$time,d,s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7);
#10 d=1;s0=0;s1=0;s2=0;
#10 d=1;s0=0;s1=0;s2=1;
#10 d=1;s0=0;s1=1;s2=0;
#10 d=1;s0=0;s1=1;s2=1;
#10 d=1;s0=1;s1=0;s2=0;
#10 d=1;s0=1;s1=0;s2=1;
#10 d=1;s0=1;s1=1;s2=0;
#10 d=1;s0=1;s1=1;s2=1;
#10;
$finish;
end
endmodule
