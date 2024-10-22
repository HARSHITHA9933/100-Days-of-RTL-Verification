`include clock_divider.v"
module clock_divider_test;
  reg clk;
  wire f2,f4,f8,f16,f32,f64;
  clock_divider inst(clk,f2,f4,f8,f16,f32,f64);
  always #5 clk=~clk;
  initial begin
    clk=0;
    #500;
    $finish;
  end
endmodule
