class packet;
  int a;         // Integer variable 'a'
  int g;         // Integer variable 'g'
  string s;      // String variable 's'

  // Declare an external task
  extern task pet(input int b, input int c);
endclass

// Define the external task 'pet'
task packet::pet(input int b, input int c);
  a = b;                      // Assign input 'b' to class variable 'a'
  $display("a=%0d", a);       // Display the value of 'a'
  g = c;                      // Assign input 'c' to class variable 'g'
  $display("g=%0d", g);       // Display the value of 'g'
  s = c;                      // Assign input 'c' to class variable 's'
  $display("s=%s", s);        // Display the value of 's'
endtask

module test;
  packet p;                   // Create an object of class 'packet'

  initial begin
    p = new;                  // Allocate memory for the object
    //p.a = 10;               // Optional manual assignment (commented out)
    //p.b = 1;                // 'b' is not declared directly in the class
    p.pet(10, "hesh");        // Call the 'pet' task with arguments
  end
endmodule
