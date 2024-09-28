`include "fulladder_using_decoder.v"
module fulladder_using_decoder_test(input wire y0,y1,y2,y3,y4,y5,y6,y7,sum,carry,output reg a,b,c); 
fulladder_using_decoder inst(.y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7), .sum(sum), .carry(carry), .a(a), .b(b), .c(c))
initial begin
  $monitor("Time=%0t a=%b b=%b c%bb y0=%b y1=%b y2=%b y3=%b y4=%b y5=%b y6=%b y7=%b, sum=%b carry=%b",$time,a,b,c,y0,y1,y2,y3,y4,y5,y6,y7,sum,carry);
  #10 a=0; b=0; c=0;
  #10 a=0; b=0; c=1;
  #10 a=0; b=1; c=0;
  #10 a=0; b=1; c=1;
  #10 a=1; b=0; c=0;
  #10 a=1; b=0; c=1;
  #10 a=1; b=1; c=0;
  #10 a=1; b=1; c=1;
  #10;
  $finish;
end
endmodule
