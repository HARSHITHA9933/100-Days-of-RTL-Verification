/* used xor gate for sum and and gate for carry by behaviour model*/
module halfadder(input a,b,output reg sum,carry);
  always @*begin
     sum=a^b;
     carry=a&b;
  end
endmodule
