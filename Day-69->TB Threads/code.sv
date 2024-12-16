//create an example for fork join
class packet;
  int a;
endclass
module test;
  packet p1;
  initial begin
    p1=new;
    fork
      begin
        #1 $display("time=%0t inside packet:process:A",$time);
      end
      begin
        #4 $display("time=%0t inside packet:process: B",$time);
      end
      begin
        #4 $display("time=%0t inside packet:process:c",$time);
      end
    join_any
      begin
        $display("time=%0t outside packet:process:d", $time); 
      end
    disable fork;
      begin
        #5 $display("time=%0t outside packet:process:e", $time);
      end
  end
endmodule
