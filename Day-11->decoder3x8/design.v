module decoder_2x4(a,b,en,y);
  input wire a,b,en;
  output reg [3:0]y;
  assign y[0]=(a&(~b)&~en);
  assign y[1]=(a&(~b&en));
  assign y[2]=(a&b&(~en));
  assign y[3]=(a&b&en);
endmodule
module decoder_3x8(a,b,c,y);
  input wire a,b,c;
  output reg [7:0]y;
  decoder_2x4 n1(~a,b,(c),y[3:0]);
  decoder_2x4 n2(a,b,c,y[7:4]);
endmodule
