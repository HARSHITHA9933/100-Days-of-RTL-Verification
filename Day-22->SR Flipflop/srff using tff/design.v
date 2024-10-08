module srff_using_tff(input s,r,clk, output q);
  wire t;
  and(and1,s,~q);
  and(and2,r,q);
  or(t,and1,and2);
  t_ff tff(t,clk,q);
endmodule
module t_ff(input t,clk,output reg q=1);
  always @(posedge clk) begin
    if(t)
      q<=~q;
    else
      q<=q;
  end
endmodule

