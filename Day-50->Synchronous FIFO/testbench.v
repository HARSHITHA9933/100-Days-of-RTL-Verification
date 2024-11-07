`include "design.v"
module testbench_tb();
  reg clk,rst,wr_en,rd_en;
  reg [7:0] wr_data;
  wire full,empty,almostfull;
  wire [7:0] rd_data;
  wire [3:0] wr_pointer,rd_pointer;
  design inst(clk,rst,wr_en,rd_en,wr_data,rd_data,full,empty,almostfull,almostempty,wr_pointer,rd_pointer);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;
    wr_en=0;
    rd_en=0;
    wr_data=8'h00;
    #10 rst=0;
    $display("starting FIFO Test...");
    if(empty&&!full)
      $display("fifo is initially empty");
    else
      $display("empty flag check failed");
    $display("Writing fifo...");
    for(int i=0;i<=16;i=i+1)
      begin
        wr_data=i;
        wr_en=1;
        #10;
      end
    wr_en=0;
    if(full)
      $display("fifo is full after 16 elements");
    else
      $display("fifo doesnot reac full as expected");
    $display('read data");
             for(int i=1;i<=16;i=i+1) begin
               rd_en=1;
               #10;
               if(rd_data==i) begin
                 $display("rd_data:%h ",rd_data,i);
               end
               else begin
                 $display("mismatch!rd_data:%h",rd_data,i);
               end
             end
             rd_en=0;
             if(almostfull)
               $display(almostfull flag is tested");
                        if(almostempty)
                          $display("almostempty flag is tested");
                        $display("FIFO is completed");
                        $finish;
             end
    endmodule
