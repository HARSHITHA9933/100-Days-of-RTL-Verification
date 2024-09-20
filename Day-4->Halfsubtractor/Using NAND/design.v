module half_nand(input wire a,b,output reg differ,borrow);
  wire w1,w2,w3;
  assign w1=~(a&b);
  assign w2=~(a&w1);
  assign w3=~(b&w1);
  assign differ=~(w1&w2);
  assign borrow=~(w3&w3);
endmodule
