class transaction;
   rand bit d;
  bit [3:0]q;
  rand bit clk;
    function void display(string label);
      $display("Time:%0t [%s]: q:%0b clk:%0b d:%0b ", $time, label,q,clk,d);
    endfunction
endclass

