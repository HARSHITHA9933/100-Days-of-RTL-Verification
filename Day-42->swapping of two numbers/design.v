module swapping(input [7:0]a,b, output reg [7:0] a_out,b_out);
  reg [7:0] temp;
  always @(*) begin
    temp=a;
    a_out=b;
    b_out=temp;
  end
endmodule
