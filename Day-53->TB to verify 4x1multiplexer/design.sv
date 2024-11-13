module mux(a,b,c,d,s1,s2,y);
input a,b,c,d;
  input s1,s2;
output reg y;
always @(*) begin
  y=(~s1&~s2&a)|(~s1&s2&b) | (s1&~s2&c) |(s1&s2&d);
end
endmodule 
