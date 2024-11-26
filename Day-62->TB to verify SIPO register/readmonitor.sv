class rdmonitor;
  virtual intf.RD_MON_MP rd_mon_inf;   // Reference to the RD_MON_MP interface
  transaction rddata;                   // Data for the scoreboard
  mailbox #(transaction) rdmon2sc;      // Mailbox to send data to the scoreboard

  reg [3:0] shift_reg;                  // 4-bit shift register to store serial input
  integer bit_count;                    // Counter to track how many bits we've shifted in

  // Constructor to initialize the interface and mailbox
  function new(virtual intf.RD_MON_MP rd_mon_inf, mailbox #(transaction) rdmon2sc);
    this.rd_mon_inf = rd_mon_inf;
    this.rdmon2sc = rdmon2sc;
    this.rddata = new();
    this.shift_reg = 4'b0000;          // Initialize shift register to zero
    this.bit_count = 0;                // Initialize bit counter
  endfunction

  // Monitor task to capture and shift data for SIPO functionality
  virtual task monitor();
    forever begin
      @(posedge rd_mon_inf.clk);       // Wait for the rising edge of the clock

      // Shift in the serial data from the input `q`
      shift_reg = {shift_reg[2:0], rd_mon_inf.q}; // Shift left and insert new bit

      bit_count = bit_count + 1;         // Increment the bit counter

      // After every 4 bits, capture the parallel data and send it to the scoreboard
      if (bit_count == 4) begin
        rddata.q = shift_reg;           // Capture the parallel output (shifted data)
        rddata.display("DATA FROM READ MONITOR");  // Debugging output
        rdmon2sc.put(rddata);           // Send data to the scoreboard
        bit_count = 0;                  // Reset bit counter
        shift_reg = 4'b0000;            // Clear the shift register for next cycle
      end
    end
  endtask
endclass

