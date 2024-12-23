class main;
  rand bit [7:0] a;
  rand bit [3:0] b;
  int c;
  constraint cl{a==2 -> b<5;};
  constraint c2{b==5;};
  constraint c3 {soft a<4;};
  function void display();
    $display("a=%0d b=%0d c=%0d",a,b,c);
  endfunction
endclass

main m;

module test;
  initial begin
    int status;
    repeat (3) begin
      m=new();
      status=m.randomize();
      $display("---allrandomisation----");
      m.display();
      status=m.randomize(a,c);
      $display("---aandcrandomisation----");
      m.display();
      status=m.randomize(c,b);
      $display("---candbrandomisation----");
      m.display();
      status=m.randomize() with {a>4;};
      $display("---disabled----");
      repeat (5) begin
        m.a.rand_mode(0);
        m.display();
      end
    end
  end
endmodule
