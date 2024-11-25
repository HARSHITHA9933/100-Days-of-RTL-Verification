// Write a constraint to generate the palindrome-like sequence 1234554321.//
class packet;
  rand bit [2:0] a[]; // Define a dynamic array of 3-bit values to hold the sequence

  // Constraint to fix the size of the array to 10 elements
  constraint c1 { a.size() == 10; }

  // Constraint to ensure the array values form a palindrome
  constraint c2 {
    foreach (a[i]) {
      if (i < 5) {
        a[i] == i + 1;        // First half of the palindrome: 1, 2, 3, 4, 5
      } else {
        a[i] == a[9 - i];     // Second half mirrors the first half
      }
    }
  }

endclass

module test;
  packet p1;

  initial begin
    p1 = new;

    repeat (10) begin
      p1.randomize(); // Generate the randomized constrained data
      $display("p1 = %0p", p1.a); // Display the array values
    end
  end
endmodule

