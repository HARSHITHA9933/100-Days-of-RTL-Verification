class parent;
  local int a;
  function new(int b);
    a=b+1;
  endfunction
  function display();
    $display("a=%0d",a);
  endfunction
endclass
class child extends parent;
  function new(int b);
    super.new();
  endfunction
endclass
module top;
  initial begin
    child c=new(10);
    parent p=new(5);
    c.display();
    p.a=2;
    p.display();
  end
endmodule
