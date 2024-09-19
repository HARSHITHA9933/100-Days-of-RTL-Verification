`include "design.v"
module tb_top;
reg a,b,c_in;
wire s_out, c_out;
full_adder inst_a(a, b, c_in, s_out, c_out);
initial begin
    $monitor("Time=%0t a=%b b=%b c_in=%b s_out=%b c_out=%b", $time, a, b, c_in, s_out, c_out);
    #5 a=0;b=0;cin=0;
    #5 a=0;b=0;cin=1;
    #5 a=0;b=1;cin=0;
    #5 a=0;b=1;cin=1;
    #5 a=1;b=0;cin=0;
    #5 a=1;b=0;cin=1;
    #5 a=1;b=1;cin=0;
    #5 a=1;b=1;cin=1;
    #5
    $finish;
  end
endmodule
