module assertion;
bit clk;
bit a,b;
always #5 clk=~clk;
initial begin
  a=0; b=1;
  #5 a=1;
  #10 b=0;
  #20 b=1; a=1;
  #30 a=0;b=1;
  #100 $finish;
end
always @(posedge clk) assert (!a);
always @(posedge clk) assert(a&b);
//always @(posedge clk) assert(a||b);
endmodule
