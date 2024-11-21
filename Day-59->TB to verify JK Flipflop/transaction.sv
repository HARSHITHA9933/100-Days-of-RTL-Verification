class transaction;
   rand bit j;
  rand bit k;
  bit q;
  bit qn;
  constraint c1{j inside{0,1};
                k inside {0,1};}
    function void display(string label);
      $display("Time:%0t [%s]: j:%0b k:%0b q:%0b qn:%0b", $time, label, j, k,q,qn);
    endfunction
endclass
