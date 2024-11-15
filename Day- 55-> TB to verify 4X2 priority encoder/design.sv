module encoder4x2(a,b,c,d,y1,y2);
  input a,b,c,d;
  output reg y1,y2;
  always @(*) begin
    y1= a|b;
    y2=a|(~(b)&c);
  end
endmodule
