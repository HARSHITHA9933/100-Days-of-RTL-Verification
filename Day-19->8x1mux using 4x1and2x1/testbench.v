`include "mux8x1.design"
module mux8x1_test(i0,i1,i2,i3,i4,i5,i6,i7,s,s0,s1,a);
input wire a;
output reg i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s;
mux8x1 inst(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .s(s), .s0(s0), .s1(s1), .a(a));
initial begin
$monitor("Time=%t i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b s=%b s0=%b s1=%b a=%b",$time,i0,i1,i2,i3,i4,i5,i6,i7,s,s0,s1,a);
#10 i0=0;i1=0; i2=1;i3=1; i4=1;i5=1; i6=0;i7=0; s0=0;sl=0;s=0;
#10 i0=0;i1=1; i2=0;i3=1; i4=1;i5=1; i6=0;i7=0; s0=0;s1=0;s=1;
#10 i0=0;i1=1; i2=0;i3=0; i4=1;i5=1; i6=0;i7=0; s0=1;s1=0;s=0;
#10;
$finish;
end
endmodule
