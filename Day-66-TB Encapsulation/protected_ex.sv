class parent;
  protected bit[3:0]a;
  int b;
  function new(int c);
    a=a+c;
  endfunction
  
  function void display();
    $display("a=%0d",a);
  endfunction
endclass
module top;
  parent p;
  initial begin
    p=new(11);
   p.b=11;
    $display("p.b=%0d",p.b);
    p.display();
  end
endmodule
