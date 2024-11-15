 class transaction;
   rand bit a;
   rand bit b;
   rand bit c;
   rand bit d;
   bit y1;
   bit y2;
  function void display(input string tag);
    $display("Time:%0t [%0s]: a:%0b b:%0b c:%b d:%b y1:%0b y2:%0b",$time, tag, a,b,c,d,y1,y2);
  endfunction
endclass
