For the signals req and gnt, the gnt should be high after 2 clock cycles after req
a) the gnt signal should be high after 2 clock cycles till 4 clock cycles
b) the gnt signal should be high for 3 clock cycles after waiting for one cycle of req
c) the gnt signal should get high after 1 clock cycle from req being high and must be high for 4 clock cycles but need not be consecutive but ackn.
d) req should be high for atleast 3 times and gnt should be high
after atleast 4 cycles (= operator)
e) req should be for atleast 3 times and gnt should be high after 4 cycles (-> goto non-consecutive repetition).
module qs4;
  int req,gnt;
  bit clk;
  property p:
    @(posedge clk) req ##2 gnt;
  endproperty
  property p2;
    @(posedge clk) req ##2 gnt[*4];
  endproperty 
  property p3;
    @(posedge clk) req |-> gnt[*3];
  endproperty
  property p4;
    @(posedge clk) req |-> gnt[=4];
  endproperty
  property p5;
    @(posedge clk) req [*3:$] ##4 gnt;
  endproperty
  property p6;
    @(posedge clk) req [3:6] |-> gnt[=4];
  endproperty
  cl:assert property (p);
  c2:assert property (p2);
  c3:assert property (p3);
  c4:assert property (p4);
  c5:assert property(p5);
  c6:assert property (p6);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    req=0;
    #10 req=0; gnt=1;
    #10 req=1;gnt=0;
    #10 req=1;gnt =1;
    #200
    $finish;
  end
endmodule
