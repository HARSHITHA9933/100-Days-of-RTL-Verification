// Write a constraint to generate the sequence 1122334455//
class packet;
  rand bit [2:0] a[]; // Define a dynamic array of 3-bit values

  // Constraint to fix the size of the array to 10
  constraint c2 { a.size() == 10; }

  // Constraint to ensure the sequence is 1122334455
  constraint c1 {
    foreach (a[i]) {
      a[i] == (i / 2) + 1; // Generate 1, 1, 2, 2, 3, 3, 4, 4, 5, 5
    }
  }
endclass

module test;
  packet p1;

  initial begin
    p1 = new;

    repeat (10) begin
      p1.randomize(); // Randomize to generate constrained data
      $display("p1 = %0p", p1.a); // Display the sequence
    end
  end
endmodule

