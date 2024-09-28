module fulladder_using_decoder(output reg y7,y6,y5,y4,y3,y2,y1,y0,sum,carry, input wire a,b,c); 
  assign yo=(~a)&(~b)&(~c);
  assign y1=(~a)&(~b)&c;
  assign y2=(~a)&(b)&(~c);
  assign y3=(~a)&b&c;
  assign y4=a&(~b)&(~c);
  assign y5=a&(~b)&c;
  assign y6=a&b&(~c);
  assign y7=a&b&c;
  assign sum=y1|y2|y4|y7;
  assign carry=y3|y5|y6|y7;
endmodule
