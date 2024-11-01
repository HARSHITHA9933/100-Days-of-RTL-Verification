module halfadder(x, y, summ, carry);
    input wire x, y;
    output reg summ, carry;
    assign summ = x ^ y;
    assign carry = x & y;
endmodule
module vedic2x2(
    input wire [1:0] a,
    input wire [1:0] b,
    output reg [3:0] s
);
    wire [3:0] w;
    assign s[0] = a[0] & b[0];
    assign w[0] = a[1] & b[0];
    assign w[1] = a[0] & b[1];
    assign w[2] = a[1] & b[1];
    halfadder n1(w[0], w[1], s[1], w[3]);
    halfadder n2(w[2], w[3], s[2], s[3]);
endmodule

