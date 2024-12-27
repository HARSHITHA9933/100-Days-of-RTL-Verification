module p;
  bit sig_a, sig_b, sig_c;
  bit clk;
  
  property p;
    ((sig_a && sig_b) && (!sig_c));
  endproperty
  
  property p1;
    sig_b |=> $rose(sig_a);
  endproperty
  
  property p2;
    $rose(sig_c) |=> $fell(sig_a);
  endproperty

  c1: assert property (@(posedge clk) (p));
  c2: assert property (@(posedge clk) (p1));
  c3: assert property (@(posedge clk) (p2));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    sig_a = 0; sig_b = 0; sig_c = 0;
    #10 sig_a = 0; sig_b = 1; sig_c = 0;
    #10 sig_a = 1; sig_b = 0; sig_c = 1;
    #10 sig_a = 1; sig_b = 1; sig_c = 1;
    #100 $finish;
  end
endmodule
