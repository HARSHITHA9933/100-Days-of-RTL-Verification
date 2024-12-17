class packet #(type T=int);
  T input_a;
  T input_b;
  T output_c;
  function void add();
    $display("addition=%0d", input_a+input_b);
    $display("addition=%4b",input_a+input_b);
  endfunction
  function void sub();
    $display("subtraction=%0d", input_a - input_b);
    $display("subtraction=%4b", input_a - input_b);
  endfunction
  function void mult();
    $display("multiplication=%0d", input_a*input_b);
    $display("multiplication=%4b", input_a*input_b);
  endfunction
  function void div();
    $display("division=%0d",input_a/input_b);
    $display("division=%4b",input_a/input_b);
  endfunction
endclass
packet pl_int;
packet #(bit[3:0]) p_bit;
packet #(real) p_real;
module test;
  initial begin
    pl_int = new();
    p_bit = new();
    p_real = new();
    pl_int.input_a = 2;
    pl_int.input_b = 1;
    pl_int.add;
    pl_int.sub;
    pl_int.mult;
    pl_int.div;
    p_bit.input_a = 8'h0010;
    p_bit.input_b = 8'h0011;
    p_bit.add;
    p_bit.sub;
    p_bit.mult;
    p_bit.div;
  end
endmodule 
