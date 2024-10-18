module modncounter(clk,out);
  input wire clk;
  output reg [3:0] out=4'b000;
  always @(posedge clk) begin
    if(out==10)
      out=0;
    else
      out=out+1;
  end
endmodule
