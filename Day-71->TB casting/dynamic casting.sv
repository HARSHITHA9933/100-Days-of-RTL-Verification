//dynamic casting
class parent;
  logic [7:0] addr;
  function void display();
    $display("parent =>addr=%0d",addr);
  endfunction
endclass
class child extends parent;
  bit [7:0] data;
  function void display();
    super.display();
    $display("CE=child=>data=%0d", data);
  endfunction
endclass
module dynamic_casting;
  parent p; child c,cl;
  initial begin
    p=new; c=new;c1=new;
    c.addr=10;
    c.data=20;
    p=c;
    if($cast(c,p)) begin $display("casting is done");
     end
    else
      $display("casting is not done");
     c.display(); 
      end
endmodule
