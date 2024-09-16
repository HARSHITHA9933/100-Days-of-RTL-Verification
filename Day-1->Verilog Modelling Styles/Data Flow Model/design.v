
/*
Dataflow modeling in Verilog uses continuous assignment statements (assign) to describe the circuit's behavior using logical 
expressions, representing the flow of data through combinational logic directly.
*/
module logic_gates(
  input wire a,b;
  output reg and_gate,or_gate,not_gate,nand_gate,nor_gate,xor_gate,xnor_gate;
);
  assign and_gate = a&b;
  assign or_gate = a|b;
  assign not_gate = ~a;
  assign nand_gate = ~(a&b);
  assign nor_gate = ~(a|b);
  assign and_gate = a&b;
endmodule
