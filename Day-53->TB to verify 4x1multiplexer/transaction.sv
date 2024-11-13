class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  rand bit d;
   rand bit s1;
   rand bit s2;
   bit y;
  function void display(input string tag);
    $display("Time:%0t [%0s]: a:%0b b:%0b c:%0b d:%0b s1:%0b s2:%0b y:%0b",$time, tag, a,b,c,d,s1,s2,y);
  endfunction
endclass
