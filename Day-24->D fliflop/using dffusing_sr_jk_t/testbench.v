`include "dff_using_sr_jk_t.v"
module dff_using_sr_jk_t_test;
reg clk,rst,d;
wire q_sr, q_jk, q_t;
  dff_using_sr_jk_t inst(clk,rst,d,q_sr,q_jk,q_t);
  initial begin 
    clk=0;
    d=0;
    forever #4 clk=~clk;
  end
  initial begin
     rst=1;
     #10;  
     rst=0;
    forever #10 d=~d;
  end 
  initial begin
    $monitor("Time=%0t clk=%0d d=%0d q_sr=%0d q_jk=%0d q_t=%0d",$time,clk,d,q_sr,q_jk,q_t);
    #80 
    $finish;
    end
endmodule
