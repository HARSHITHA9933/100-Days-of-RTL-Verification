module divisibleby5_tb;
    reg clk, reset, in;
    wire out;
    
    // Instantiate the module
    divisibleby5 dut(
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );
    
    // Clock generation
    always #10 clk = ~clk;
    
    initial begin
        // Initialize signals
        $monitor("Time=%0t in=%0b out=%0b", $time, in, out);
        clk = 0;
        
        // Reset sequence
        #10 reset = 0;
        #20 reset = 1;
        
        // Test sequence
        #20 in = 0;
        #20 in = 1;
        #20 in = 0;
        #20 in = 1;
        #20 in = 0;
        #20 in = 1;
        #20 in = 0;
        #20 in = 1;
        #20 in = 1;
        #20;
        
        $finish;
    end
    
endmodule
