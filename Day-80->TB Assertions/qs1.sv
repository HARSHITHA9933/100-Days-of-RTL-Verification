Write an assertion or condition that ensures `sig_a` must not rise in the clock cycles after `sig_b` is observed and before the next occurrence of `sig_c`. This implies that `sig_a` is restricted from rising during the interval from the cycle immediately following the observation of `sig_b` until the cycle just before the observation of `sig_c`."
module packet;
  bit sig_a, sig_b,sig_c;
  bit clk;
  property p;
    @(posedge clk) sig_bl->((!$rose (sig_a)) throughout (!$rose(sig_c)));
  endproperty
  c1:assert property (p);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    sig_a=0;sig_b=0;sig_c=0;
    #10 sig_a=0; sig_b=0;sig_c=1;
    #10 sig_a=0;sig_b=1;sig_c=0;
    #10 sig_a=0;sig_b=1;sig_c=1;
    #10 sig_a=1;sig_b=0;sig_c=0;
    #10 sig_a=1;sig_b=0;sig_c=1;
    #10 sig_a=1;sig_b=1;sig_c=0;
    #10 sig_a=1;sig_b=1;sig_c=1;
    #10 sig_a=0;sig_b=1;sig_c=0;
    #100
    $finish;
  end
endmodule
