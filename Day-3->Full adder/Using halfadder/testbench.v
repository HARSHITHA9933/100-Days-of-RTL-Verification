`include "design.v"
module tb_top;
reg a,b,c_in;
wire s_out, c_out;
full_adder inst_a(a, b, c_in, s_out, c_out);
initial begin
    $monitor("Time=%0t a=%b b=%b c_in=%b s_out=%b c_out=%b", $time, a, b, c_in, s_out, c_out);
    #1; a = 1; b = 0; c_in = 0;
    #1; a = 0; b = 1; c_in = 0;
    #1; a = 1; b = 1; c_in = 0;
    #1; a = 0; b = 0; c_in = 1;
    #1; a = 1; b = 1; c_in = 1;
end
endmodule
