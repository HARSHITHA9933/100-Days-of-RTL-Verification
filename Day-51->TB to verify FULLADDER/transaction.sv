class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  bit sum;
  bit carry;
  function void display(input string tag);
    $display("Time:%0t [%0s]: a:%0b b:%0b c:%0b summ:%0b carry:%0b",$time, tag, a,b,c,sum,carry);
  endfunction
endclass
