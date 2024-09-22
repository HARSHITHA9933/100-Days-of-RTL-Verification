module fulladder(a,b,c,sum,carry);
  input a,b,c;
  output reg sum,carry;
assign sum=a^b^c;
assign carry=((a&b)|(b&c)|(c&a));
endmodule
module ripplecarryadder( A,B,cin,S,C);
  input [3:0]A,B;
  input cin;
  output reg [3:0]S,C;
  fulladder w1(A[0],B[0],cin,S[0],C[0]);
  fulladder w2(A[1],B[1],C[0],S[1],C[1]);
  fulladder w3(A[2],B[2],C[1],S[2],C[2]);
  fulladder w4(A[3],B[3],C[2],S[3],C[3]);
endmodule

