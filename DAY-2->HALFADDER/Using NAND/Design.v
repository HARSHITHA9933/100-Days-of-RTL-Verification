/*using nand gates complement of and gate*/

module ha_nand(input a,b,output reg carry);
  wire w1,w2,w3;
  assign w1=~(a&b);
  assign w2=~(w1&a);
  assign  w3=~(w1&b);
  assign carry=~(w1&w1);
  assign summ=~(w2&w3);
endmodule
