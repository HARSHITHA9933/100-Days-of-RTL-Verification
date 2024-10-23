module dff(clk, reset,d,q); 
input wire clk, reset,d;
output reg q:
always @(posedge clk)
begin
if(reset)
q<=0;
else
q<=d;
end
endmodule
module mod3counter (input wire clk, reset, output reg [1:0] count);
always @(posedge clk)
begin
if (reset)
count<=0;
else
if(count==2)
count<=0;
else
count=count+1;
end
endmodule
module freqby3(clk, reset, out);
input wire clk, reset;
output reg out;
wire[1:0] q;
wire temp:
mod3counter n1(clk,reset,q);
dff n2 (clk, reset,q[1],temp);
assign out=q[1]|temp;
endmodule
