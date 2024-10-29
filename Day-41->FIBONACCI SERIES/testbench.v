`include "fibonacci.v"
module fibonacci_tb;
    parameter N = 10;
    reg clk, rst;
    wire [3:0] out;
    fibonacci #(N) dut(.clk(clk), .rst(rst), .out(out));
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst = 0;
        #10 rst = 1;
        #((N+1) * 10) $finish;
    end
    initial begin
        $monitor("Time=%0t clk=%0b rst=%0b out=%0b", $time, clk, rst, out);
    end
endmodule
