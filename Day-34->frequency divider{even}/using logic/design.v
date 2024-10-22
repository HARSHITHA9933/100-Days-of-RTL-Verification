module clock_divider(input clk, output reg f2,f4,f8,f16,f32,f64);
  reg[5:0] count=0;
  always @(posedge clk) begin
    count<=count+1;
    f2<=count[0];
    f4<=count[1];
    f8<=count[2];
    f16<=count[3];
    f32<=count[4];
    f64<=count[5];
  end
endmodule
