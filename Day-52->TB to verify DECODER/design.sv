module decoder(a,b,y1,y2,y3,y4);
input a,b;
output reg y1,y2,y3,y4;
always @(*) begin
  y1=~a&~b;
  y2=~a&b;
  y3= a&~b;
  y4= a&b; 
end
endmodule 
