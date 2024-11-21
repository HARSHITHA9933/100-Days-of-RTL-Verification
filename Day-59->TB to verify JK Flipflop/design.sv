module jk_ff (
    input wire clk,        // Clock signal
    input wire reset,      // Asynchronous reset signal
    input wire j,          // J input
    input wire k,          // K input
    output reg q,          // Q output
    output wire qn         // Complementary Q output
);

    // Assign the complementary output
    assign qn = ~q;

    // Flip-flop behavior
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Asynchronous reset sets Q to 0
            q <= 1'b0;
        end else begin
            case ({j, k})
                2'b00: q <= q;        // No change
                2'b01: q <= 1'b0;     // Reset
                2'b10: q <= 1'b1;     // Set
                2'b11: q <= ~q;       // Toggle
            endcase
        end
    end

endmodule
