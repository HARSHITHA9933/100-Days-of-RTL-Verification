class packet;
  rand bit [2:0] a;        // Random variable
  randc bit [2:0] b;       // Random cyclic variable

  // Function to display the values of a and b
  function void display();
    $display("a=%0d b=%0d", a, b);
  endfunction
endclass

module top;
  packet p;                // Declare the class instance
  initial begin
    p = new();             // Create a new instance of the packet class
    repeat (10) begin
      p.randomize();       // Randomize the instance
      p.display();         // Display the values of a and b
    end
  end
endmodule
