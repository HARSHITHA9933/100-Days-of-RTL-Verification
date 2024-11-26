class packet;
  // Declare a dynamic array of integers to be randomized
  rand int a[];

  // Constraint to ensure the array has exactly 9 elements
  constraint c2 { a.size() == 9; }

  // Constraint to ensure the first element of the array is 9
  constraint cl { a[0] == 9; }

  // Constraint to ensure each subsequent element in the array 
  // is 10 more than the previous element
  constraint c3 {
    foreach (a[i]) 
      if (i > 0)
        a[i] == a[i - 1] + 10;
  }
endclass

// Instantiate the class and test its functionality
packet p1;

module test;
  initial begin
    // Create a new instance of the packet class
    p1 = new;

    // Repeat the randomization and display process 5 times
    repeat (5) begin
      // Randomize the packet object
      p1.randomize();
      // Display the randomized array (fixing a typo in variable name `pl` to `p1`)
      $display("p1.a = %0p", p1.a);
    end
  end
endmodule


