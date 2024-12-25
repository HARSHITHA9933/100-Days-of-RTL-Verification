module qs3;
int req, gnt;
bit clk;
property p;
  @(posedge clk) req |-> gnt;
endproperty
property p2;
  @(posedge clk) req |=> gnt;
endproperty
c1: assert property (p);
c2: assert property (p2);
initial begin
  clk = 0;
  forever #5 clk = ~clk;
end
initial begin
  req = 0;
  #10 req = 0; gnt = 1;
  #10 req = 1; gnt = 0;
  #10 req = 1; gnt = 1;
  #200
  $finish;
end
endmodule
