interface intf;

  // Clock signal for synchronization
  logic clk;

  // 4-bit signals for the flip-flop or DUT
  logic [3:0] q;
  logic [3:0] qbar;

  // Define modports for different components
  modport WR_DRV_MP (output clk, output q, output qbar); // Write driver will output clk, q, and qbar
  modport WR_MON_MP (input clk, input q, input qbar);    // Write monitor will input clk, q, and qbar
  modport RD_MON_MP (input clk, input q, input qbar);    // Read monitor will also input clk, q, and qbar

endinterface
