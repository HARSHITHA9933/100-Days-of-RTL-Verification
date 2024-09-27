
`include "decoder3x8.v"
module decoder_test_3x8(a,b,c,y);
  output reg a,b,c;
  input wire [7:0]y;
  decoder_3x8 inst(.a(a), .b(b), .c(c), .y(y));
  initial begin
    $monitor("Time=%t a=%b b=%b c%b y=%b",$time,a,b,c,y);
    #10 a=0; b=0; c=0;
    #10 a=0; b=0; c=1;
    #10 a=0; b=1; c=0;
    #10 a=0; b=1; c=1;
    #10 a=1; b=0; c=0;
    #10 a=1; b=0; c=1;
    #10 a=1; b=1; c=0;
    #10 a=1; b=1; c=1;
    #10
    $finish;
  end
endmodule
