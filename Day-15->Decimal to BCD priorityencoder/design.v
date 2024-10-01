module decimal_bcd(a,b,c,e,d);
input wire [1:9]d;
output reg a,b,c,e;
  
assign a=((d[1]&~d[2]&~d[4]&~d[6]&~d[8])|(d[3]&~d[4]&~d[6]&~d[8]]|(d[5]&~d[6]&~d[8]]|(d[7]&~d[8])|d[9]);
assign b=((d[2]&~d[4]&~d[5]&~d[8]&~d[9])|(d[3]&~d[4]&~d[5]&~d[8]&~d[9])|(d[6]&~d[8]&~d[9])|(d[7]&~d[8]&~d[9]));
assign c=((d[4]|d[5]|d[6]|d[7])&(~d[8]&~d[9]));
assign e=d[8]|d[9];
endmodule
