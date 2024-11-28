class transaction;
  rand bit [3:0] q;         // Randomized if needed for stimulus
  rand bit [3:0] qbar;      // Randomized if needed for stimulus
  bit clk;                  // Clock is not randomized

  // Display the transaction details
  function void display(string label);
    $display("Time: %0t [%s] | clk: %0b | q: %0b | qbar: %0b", $time, label, clk, q, qbar);
  endfunction
endclass
