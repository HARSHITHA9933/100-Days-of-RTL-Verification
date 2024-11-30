class packet;
  integer q;

  function integer delay();
    delay = q * q;
  endfunction
endclass

class linkedpacket extends packet;
  integer q;

  function integer delay();
    super.q = 3; // Set the parent class's q
    delay = super.delay() + q * super.q;
  endfunction
endclass

module test;

  packet p1;
  linkedpacket p2;

  initial begin
    p1 = new;
    p2 = new;
    p1.q = 2;
    p2.q = 4;
    // Call and print the delay function results
    $display("The p1.delay is %0d", p1.delay());
    $display("The p2.delay is %0d", p2.delay());
  end

endmodule
