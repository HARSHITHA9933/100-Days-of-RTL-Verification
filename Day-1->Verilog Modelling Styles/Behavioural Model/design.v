/*
Behavioral modeling in Verilog describes the logic and functionality of a design using high-level constructs like always blocks.
*/
module logic_gates(
  input wire a,b;
  output reg and_gate,or_gate,not_gate,nand_gate,nor_gate,xor_gate,xnor_gate;
);
  always @(*) begin
    and_gate = a&b;
    or_gate = a|b;
    not_gate = ~a;
    nand_gate = ~(a&b);
    nor_gate = ~(a|b);
    xor_gate = a^b;
    xnor_gate = ~(a^b);
  end
endmodule
