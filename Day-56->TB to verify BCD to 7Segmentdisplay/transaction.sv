 class transaction;
   rand bit [3:0] bcd;
   bit [6:0]seg;
  function void display(input string tag);
    $display("Time:%0t [%0s]: bcd:%0b seg:%0b ",$time, tag, bcd,seg);
  endfunction
endclass
