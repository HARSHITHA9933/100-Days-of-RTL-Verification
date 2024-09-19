module half_adder(input wire a, b,output reg sum, carry);
always @* begin
    sum = a ^ b;
    carry = a & b;
end
endmodule
module full_adder(input wire a, b, c_in,output reg sum, c_out);
wire s1, c1, c2;
half_adder ha1(a, b, s1, c1);
half_adder ha2(s1, c_in, sum, c2);
assign c_out = c1 | c2;
endmodule
