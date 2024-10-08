module srff_using_dff(input s,r,clk,output q);
  wire d;
  not(r_not,r);
  or(d,s,r_not);
  d_ff dff(d,clk,q);
endmodule
module d_ff(input d,clk,uotput eg q);
  always @(posedge clk) begin
    q<=d;
  end
endmodule
