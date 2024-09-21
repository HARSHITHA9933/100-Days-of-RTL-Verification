module half_sub(a,b,difference,borrow);
  input wire a,b;
  output reg difference,borrow;
  assign difference=a^b;
  assign borrow=(~a)&b;
endmodule
module full_sub(a,b,cin,difference,borrow);
  input wire a,b,cin;
  output reg difference,borrow;
  wire w1,w2,w3;
  half_sub f1(a,b,w1,w2);
  half_sub f2(w1,cin,difference,w3);
  assign borrow=w2|w3;
endmodule
