//write a program to generate 4 process (packet generators) that have access to 1 resource (ethernet drivers) at the same time using semaphore.
//create semaphore amd put different keys back to it.use new().get(), put(),try_get() methods.
module exl;
  semaphore a new(1);
  function void display();
    a=new(1);
  endfunction
  task process_a;
    a.get(1);
    $display("Time=%0t packet is taken", $time);
    #10 a.put(1);
    $display("Time=%0t a out", $time);
  endtask
  task process_b;
    a.get(1);
    $display("Time=%0t packet is taken", $time);
    #10 a.put(1);
    $display("Time=%0t bout ",$time);
  endtask
  task process_c;
    a.get(1);
    $display("Time=%0t c packet is taken", $time);
    #10 a.put(1);
    $display("Time=%0t c out", $time);
  endtask
  task process d;
    if(a.try_get(1))
      $display("Time=%0t packet is taken", $time);
    else
      $display("Time=%0t not available",$time);
    #10 a.put(1);
    $display("Time=%0t d out", $time);
  endtask
  initial begin
    fork
      process a;
      process b;
      process_c;
      process_d;
    join
  end
endmodule
