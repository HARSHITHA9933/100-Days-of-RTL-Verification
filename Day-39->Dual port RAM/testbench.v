`include "dual_port_ram.v" 
module dual_port_ram_test; 
  parameter ADDR_SIZE=4; 
  parameter DATA_SIZE=8;
  parameter DEPTH=16;

reg clk,cs,we, re, oe;
reg [DATA_SIZE-1:0]data_in;
reg [DATA_SIZE-1:0]data_out:
reg [DATA_SIZE-1:0]tb_data;
reg [ADDR_SIZE-1:0]wr_address:
reg [ADDR_SIZE-1:0]rd_address;

always #10 clk=~clk;
assign data_in = we ? tb_data:8hz:
  dual_port_ram inst(clk,cs,we,re,oe,data_in,data_out,wr_address,rd_address);
initial begin
  $monitor("Time=%d data_in=%d wr_address=%d data_out=%d rd_address=%d", $time,data_in,wr_address,data_out,rd_address);
clk=0; we=0; re=0; oe=0; cs=0;
#10 cs=1; we=1; tb_data=1; wr_address=1;
#20 cs=1; we=1; tb_data=2; wr_address=2;
#20 cs=1; we=1; tb_data=3; wr_address=3;
#20 cs=1; we=1; tb_data=4; wr_address=4;
#20 cs=1; we=1; tb_data=5; wr_address=5;
#20 cs=1; we=1; tb_data=6; wr_address=6;
#20 cs=1; we=1; tb_data=7; wr_address=7;
#20 cs=1; we=1; tb_data=8; wr_address=8;
#20 cs=1; we=1; tb_data=9; wr_address=9;
#20 cs=1; we=1; tb_data=10; wr_address=10;
#20 cs=1; we=1; tb_data=11; wr_address=11; 
#20 cs=1; we=1; tb_data=12; wr_address=12;
#20 cs=1; we=1; tb_data=13; wr_address=13;
#20 cs=1; we=1; tb_data=14; wr_address=14; 
#20 cs=1; we=1; tb_data=15; wr_address=15;
#20 cs=1; we=1; tb_data=0; wr_address=0;
#20
#150
$finish;
end
initial begin
#50 re=1; oe=1; rd_address=1;
#20             rd_address=2;
#20             rd_address=3;
#20             rd_address=4;
#20             rd_address=5;
#20             rd address=6;
#20             rd_address=7;
#20             rd_address=8;
#20             rd_address=9;
#20             rd_address=10;
#20             rd_address=11;
#20             rd_address=12;
#20             rd_address=13;
#20             rd_address=14;
#20             rd_address=15;
#20             rd_address=0;
#20
#150
$finish;
end
endmodule
