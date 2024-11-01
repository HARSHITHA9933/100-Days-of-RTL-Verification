`include "vedic4.v"
module vedic4_tb(p, q, out);
    output reg [3:0] p;
    output reg [3:0] q;
    input wire [7:0] out;
    vedic4 dut(p, q, out);
    initial begin
        $monitor("time=%0t p=%0b q=%0b out=%0b", $time, p, q, out);
        p = 4'b1111; q = 4'b1011;
        #10;
        p = 4'b1111; q = 4'b1111;
        #10;
        p = 4'b1110; q = 4'b1110;
        #10;
        p = 4'b1101; q = 4'b1100;
        #10;
        $finish;
    end
endmodule

