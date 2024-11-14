module fa(a,b,c,sum,carry);
  input a,b,c;
  output reg sum,carry;
  always @(*) begin
    sum=a^b^c;
    carry=(a&b)|(b&c)|(c&a);
  end
endmodule
module ripplecarryadder(a,b,cin, sum,carry);
  input [3:0]a,b;
  input cin;
  output reg [3:0]sum,carry;
  fa d1(a[0],b[0],cin,sum[0],carry[0]);
  fa d2(a[1],b[1],carry[0],sum[1],carry[1]);
  fa d3(a[2],b[2],carry[1],sum[2],carry[2]);
  fa d4(a[3],b[3],carry[2],sum[3],carry[3]);
endmodule 
