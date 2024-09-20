module half_nor(input wire a,b,output reg differ,borrow);
  wire w1,w2,w3,w4;
  assign w1=~(a|b);
  assign borrow=~(a|w1);
  assign w2=~(b|w1);
  assign w3=~(borrow|w2);
  assign differ=~(w3|w3);
endmodule
