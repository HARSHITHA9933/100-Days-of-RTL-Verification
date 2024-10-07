`include "nandlatch.v"
module nandlatch_test(s,r,en,q,qn);
  input wire q,qn;
  output reg s,r,en;
  nandlatch inst(.en(en), .s(s), .r(r), .q(q), .qn(qn));
  initial begin
    $monitor("time=%t en=%b s=%b r=%b q=%b qn=%b",$time,s,r,q,qn);
    #10 en=0;s=0;r=0;
    #10 en=1;s=0;s=0;
    #10 en=0;s=0;r=1;
    #10 en=1;s=0;s=1;
    #10 en=0;s=1;r=0;
    #10 en=1;s=1;r=0;
    #10 en=0;s=1;r=1;
    #10 em=0;s=1;r=1;
    #10
    $finish;
  end
endmodule
