module srff_using_jkff(input s,r,clk,output q);
wire j,k;
reg q;
  assign j=s;
  assign k=r;
  jk_ff jkff(j,k,clk,q);
endmodule
module jk_ff(input j,k,clk,output reg q);
  always @(posedge clk) begin
    case({j,k})
      2'b00:q<=q;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<=1'bx;
    endcase
  end
endmodule
