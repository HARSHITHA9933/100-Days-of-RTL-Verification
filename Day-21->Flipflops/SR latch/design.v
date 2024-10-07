module nandlatch(s,r,en,q,qn);
  input wire s,r,en;
  output reg q,qn;
  assign q=~(s&qn);
  assign qn=~(r&q);
endmodule
