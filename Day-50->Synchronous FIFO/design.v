module design(clk,rst,wr_en,rd_en,wr_data,rd_data,full,empty,almostfull,almostempty,wr_pointer,rd_pointer);
  input clk,rst,wr_en,rd_en;
  input [7:0] wr_data;
  output reg full,empty,almostfull,almostempty;
  output reg [3:0] wr_pointer,rd_pointer;
  output reg [7:0] rd_data;
  parameter DEPTH=16;
  parameter ALMOSTFULL=DEPTH-2;
  parameter ALMOSTEMPTY=DEPTH-2;
  reg[7:0] mem[0:DEPTH-1];
  reg[4:0]fifo_count;
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      wr_pointer<=0;
      rd_pointer<=0;
      fifo_count<=0;
      full<=0;
      empty<=1;
      almostfull<=0;
      almostempty<=1;
    end
    else begin
      if(wr_en && !full) begin
        mem[wr_pointer]<=wr_data;
        wr_pointer=wr_pointer+1;
        fifo_count<=fifo_count+1;
      end
      if(rd_en && !empty) begin
        rd_data=mem[rd_pointer];
        rd_pointer<=rd_pointer+1;
        fifo_count<=fifo_count-1;
      end
      full<=(fifo_count=DEPTH);
      empty<=(fifo_count==0);
      almostfull<=(fifo_count>=ALMOSTFULL);
      almostempty<=(fifo_count<=ALMOSTEMPTY);
    end
  end
  endmodule
