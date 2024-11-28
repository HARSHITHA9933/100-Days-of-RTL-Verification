module dff(input wire d, clk, output reg q = 1'b1, output reg qbar);
  always @(posedge clk) begin
    q <= d;       // Assign data to q on rising edge of clk
    qbar <= ~q;   // Assign inverted data to qbar
  end
endmodule
module d_sync_counter(input wire clk, output reg [3:0] q, output reg [3:0] qbar);
  wire w1, w2, w3;
  // D flip-flops to hold the state of the counter
  dff d1(.d(qbar[0]), .clk(clk), .q(q[0]), .qbar(qbar[0]));
  // Define intermediate logic for flip-flop inputs
  assign w1 = (q[0] ^ q[1]);
  dff d2(.d(w1), .clk(clk), .q(q[1]), .qbar(qbar[1])); 
  assign w2 = (q[2] ^ (q[1] & q[0]));
  dff d3(.d(w2), .clk(clk), .q(q[2]), .qbar(qbar[2])); 
  assign w3 = (q[3] ^ (q[2] & q[1] & q[0]));
  dff d4(.d(w3), .clk(clk), .q(q[3]), .qbar(qbar[3]));
endmodule
