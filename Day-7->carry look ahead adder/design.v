module halfadder (input wire a,b,output reg sum, carry);
  always @* begin 
    sum=a^b;
    carry=a&b;
  end
endmodule
module carrylook(a,b,cin, S, Cout);
  input wire [3:0]a,b; 
  input wire cin;
  output reg [3:0]S; 
  output reg Cout;
  wire [7:0]w;
  wire cl,c2,c3;
  halfadder nl(a[0],b[0],w[0],w[1]); 
  halfadder n2(a[1],b[1],w[2],w[3]);
  halfadder n3(a[2],b[2],w[4],w[5]);
  halfadder n4(a[3],b[3],w[6],w[7]); 
  assign cin=1'b0;
  assign cl=w[1]| (w[0]&cin):
  assign c2=w[3]|(w[2]&w[1])|(w[2]&w[0]&cin);
  assign c3=w[5]|(w[4]&w[3])|(w[4]&w[2]&w[0]&cin);
  assign Cout= (w[7]|(w[6]&w[5])|(w[3]&w[4]&w[2]&w[1])|(w[6]&w[4]&w[2]&w[0]&cin));
  assign S[0]=cin^w[0];
  assign S[1]=cl^w[2];
  assign 5[2]=c2^w[4];
  assign 5[3]=c3^w[6];
  endmodule
