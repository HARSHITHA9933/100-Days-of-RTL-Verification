module multiplier_4bit(
input wire [3:0]a,
input wire [3:0]b,
output reg [7:0]p
);
 always @(*) begin
 p=a*b;
 end
 endmodule
