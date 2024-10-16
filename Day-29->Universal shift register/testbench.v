`include "universal_shift_register.v"
module universal_shift_register_test();
  reg clk, reset, shift_left, shift_right;
  reg [7:0] parallel_in;
 wire [7:0] parallel_out;
 universal_shift_register inst(clk, reset, shift_left, shift_right, parallel_in, parallel_out);
 initial begin
    clk = 1'b0;
    forever #5 clk= ~clk;
 end
  initial begin
    reset = 1'b1;
    shift_left = 1'b0;
    shift_right = 1'b0;
    parallel_in = 8'he5;
    #10;
    reset = 1'b0;
    #10;
    shift_left = 1'b1;
    shift_right = 1'b0;
    #10;
    shift_left = 1'b0;
    shift_right = 1'b1;
    #10;    
    shift_left = 1'b1;
    shift_right = 1'b0;
    #10;
    shift_left = 1'b1;
    shift_right = 1'b0;
    #10;
    shift_left = 1'b0;
    shift_right = 1'b1;
  end 
  initial begin
   $monitor("Time=%0t parallel_in=%b shift_right=%b shift_left=%b parallel_out=%b",$time,parallel_in, shift_right, shift_left, parallel_out);
  #100;
  $finish;
  end
endmodule

