module vendingmachine (clk, reset, in, out, change);
input clk, reset;
input [1:0]in;
output reg out;
output reg [1:0]change;
parameter 
a=2'b00,b=2'b01,c=2'b10;
bit [1:0]state;
always @(posedge clk or negedge reset) begin
if(!reset)
begin
state<=a;
out =0;
change=2'b00;
end
else begin
case(state)
a:begin
if(in==2'b00) begin state=a; out=0; change=2'b00; end
else if(in==2'b01) begin state=b; out=0; change=2'b00; end
else if(in==2'b10) begin state=c; out=0; change=2'b00; end
end
b:begin
if(in==2'b00)begin state=a; out=0; change=2'b01; end
else if(in==2'b01) begin state=c; out=0; change=2'b00; end
else if(in==2'b10) begin state=a; out=1; change=2'b00; end
end
c:begin
if(in==2'b00) begin state=c; out=0; change=2'b10; end
else if(in==2'b01) begin state=a; out=1; change=2'b00; end
else if(in==2'b10) begin state=a; out=1; change=2'b01; end
end
endcase
end
endmodule
