module logic_gates_tb(
  input wire and_gate,or_gate,not_gate,nand_gate,nor_gate,xor_gate,xnor_gate,output reg a,b);
  logic_gates dut(.a(a), .b(b), .and_gate(and_gate), .or_gate(or_gate), .not_gate(not_gate), .nand_gate(nand_gate), .nor_gate(nor_gate), .xor_gate(xor_gate), .xnor_gate(xnor_gate));
  initial begin
    $monitor("CE= a=%b b=%b and_gate=%b or_gate=%b not_gate=%b nand_gate=%b nor_gate=%b xor_gate=%b xnor_gate=%b",$time,a,b,and_gate,or_gate,not_gate,nand_gate,nor_gate,xor_gate,xnor_gate);

    #1 a=1'b0;b=1'b0;
    #1 a=1'b0;b=1'b0;
    #1 a=1'b0;b=1'b0;
    #1 a=1'b0;b=1'b0;
  end
endmodule
  
