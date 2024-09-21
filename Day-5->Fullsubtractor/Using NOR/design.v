module full_sub_nor(a,b,cin,difference,borrow);
  input wire a,b,cin;
  output reg difference,borrow;
  wire w[6:0];
  assign w[0]=~(a|b);
  assign w[1]=~(w[0]|a);
  assign w[2]=~(w[0]|b);
  assign w[3]=~(w[1]|w[2]);
  assign w[4]=~(w[3]|cin);
  assign w[5]=~(w[3]|w[4]);
  assign w[6]=~(w[4]|cin);
  assign difference =~(w[5]|w[6]);
  assign borrow=~(w[2]|w[6]);

endmodule
