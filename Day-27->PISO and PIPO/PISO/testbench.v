`include "dffpiso.v"
 module dffpiso_test(a,clk, load, qn);
 input wire [3:0]qn;
output reg clk, load;
output reg [3:0]a;
dffpiso inst(.a(a), .load(load), .clk(clk), .qn(qn));
always #10 clk= ~clk;
initial begin
$monitor("Time=%0t a=%b load=%b qn=%b", $time, a, load,qn);
 clk=0;
 #10 load=1'bl;a=4'b1010;
 #10 load=1'b0;
 #90 load=1'bl;a=4'bl011;
 #10 load=1'b0;
 #70 load=1'bl;a=4'bll10;
 #10 load=1'b0;
 #70 load=1'b1; a=4'bll11;
 #10 load=1'b0;
 #80
$finish;
end
endmodule
