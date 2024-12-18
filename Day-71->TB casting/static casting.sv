module static casting;
  real a,b;
  int c=2,d;
  initial begin
    a=(3*4+5*2);
    d=int'(a);
    $display("d=%0d",d);
    b=real'(c);
    $display("b=%0f",b);
  end
endmodule
