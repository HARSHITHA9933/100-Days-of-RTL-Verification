'include "BCDto7segment.v"
module tb_BCDto7Segment;
    reg [3:0] bcd;
    wire [6:0] seg;
    BCDto7Segment uut (.bcd(bcd),.seg(seg) );
    initial begin
        // Apply BCD inputs from 0 to 9
        $monitor("Time: %0t  BCD: %b Segment Output: %b", $time, bcd, seg);

        bcd = 4'b0000; #10;  // Test for 0
        bcd = 4'b0001; #10;  // Test for 1
        bcd = 4'b0010; #10;  // Test for 2
        bcd = 4'b0011; #10;  // Test for 3
        bcd = 4'b0100; #10;  // Test for 4
        bcd = 4'b0101; #10;  // Test for 5
        bcd = 4'b0110; #10;  // Test for 6
        bcd = 4'b0111; #10;  // Test for 7
        bcd = 4'b1000; #10;  // Test for 8
        bcd = 4'b1001; #10;  // Test for 9
        // Test invalid inputs (A to F)
        bcd = 4'b1010; #10;  // Test for A (invalid)
        bcd = 4'b1011; #10;  // Test for B (invalid)
        bcd = 4'b1100; #10;  // Test for C (invalid)
        bcd = 4'b1101; #10;  // Test for D (invalid)
        bcd = 4'b1110; #10;  // Test for E (invalid)
        bcd = 4'b1111; #10;  // Test for F (invalid)
// Finish simulation
        $stop;
    end
endmodule

