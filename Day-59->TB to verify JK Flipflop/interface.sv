interface intf;
    // Declare clock and reset as general logic
    logic clk, reset;
    logic j, k, q, qn;

    // Define modports for different components
    modport WR_DRV_MP (output j, k, input clk, reset);
    modport WR_MON_MP (input j, k, clk, reset);
    modport RD_MON_MP (input q, qn, clk, reset);
endinterface
