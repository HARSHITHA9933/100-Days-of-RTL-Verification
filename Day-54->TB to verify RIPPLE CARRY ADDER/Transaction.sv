class transaction;
   rand bit [3:0]a;
   rand bit [3:0]b;
  rand bit cin;
   bit [3:0]sum;
   bit carryout;
  function void display(input string tag);
     $display("Time:%0t [%0s]: a:%0b b:%0b cin:%b sum:%b carry:%0b",$time, tag, a,b,cin,sum,carryout);
  endfunction
endclass
