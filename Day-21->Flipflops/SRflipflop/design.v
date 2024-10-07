module srff(clk,s,r,q);
  input wire clk,s,r;
  output reg q:
  always @(posedge clk) begin
    case({s,r})
      2'b00:
        q<=q;
      2'b01:
        q<=0;
      2'b10:
        q<=1; 
      2'b11:
        q<=1'bx;
      default q<=q;
    endcase
  end
endmodule

