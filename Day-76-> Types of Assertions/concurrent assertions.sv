module example;
  bit clk;
  bit a,b;
  always #5 clk=~clk;
  sequence s1;
    a ##0 b;
  endsequence
  property p;
    s1;
  endproperty
  al: assert property (@(posedge clk)(p));
  initial begin
    a=1;
    #10 b=1;
    #100
    $finish;
  end
endmodule
