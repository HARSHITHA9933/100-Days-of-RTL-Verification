// Define a class `packet` for generating Fibonacci series
class packet;
  // Declare a random dynamic array of 8-bit values
  rand bit [7:0] a[];

  // Constraint to ensure the array size is fixed at 10
  constraint cl {
    a.size == 10; // Array contains exactly 10 elements
    a[0] == 1;    // First Fibonacci number is 1
    a[1] == 1;    // Second Fibonacci number is 1
  }

  // Constraint to generate the Fibonacci sequence:
  // Each element (from the third onwards) is the sum of the two previous elements
  constraint c2 {
    foreach (a[i]) 
      if (i >= 2) 
        a[i] == a[i-1] + a[i-2]; // Fibonacci rule
  }
endclass

// Instantiate the class and test its functionality
packet p1;

module test;

initial begin
  // Create a new instance of the `packet` class
  p1 = new;

  // Randomize and display the Fibonacci sequence 5 times
  repeat (5) begin
    // Perform randomization to generate a valid Fibonacci series
    if (p1.randomize()) begin
      // Display the randomized Fibonacci series
      $display("p1.a = %0p", p1.a);
    end else begin
      $display("Randomization failed!");
    end
  end
end

endmodule
