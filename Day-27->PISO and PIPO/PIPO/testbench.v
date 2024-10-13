`include "dffpipo.v"
module dffpipo_test(a,clk,qn);
  input wire [3:0]qn;
  output reg [3:0]a;
  dffpipo inst(.a(a), .clk((clk), .qn(qn));
 initial begin
   clk=0;
   forever #10 clk=~clk;
 end
               $monitor("Time=%0t a=%0b clk=%0b qn=%0b",$time,a,clk,qn);
               #10 a=4'b1010;
               #10 a=4'b1011;
               #10 a=4'b1110;
               #10 a=4'b1111;
               #10
               $finish;
               end
               endmodule
