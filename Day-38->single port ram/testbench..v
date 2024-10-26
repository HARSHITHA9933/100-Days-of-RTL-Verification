`include "single_port_ram.v"
module single_port_ram_test;
parameter DATA_WIDTH=8;
parameter ADDR_SIZE=4;
parameter DEPTH=16;

reg clk,cs,wr,oe;
wire [DATA_WIDTH:1]data;
reg [ADDR_SIZE-1:0]address;
reg [DATA_WIDTH-1:0]tb_data;
always #10 clk=-clk;
single_port_ram inst(clk,cs, wr, oe, address, data);
initial begin
$monitor("Time=%t data=%d Address=mem[%d]",$time, data, address);
  clk=0; cs=0; wr=0; oe=0;
$display("writing operations");
#30 cs = 1; wr = 1; tb_data=1; address=10;
#20 cs = 1; wr = 1; tb_data=2; address=11;
#20 cs = 1; wr = 1; tb_data=3; address=12;
#20 cs = 1; wr = 1 ;tb_data=4; address=13;
#20 cs = 1; wr = 1; tb_data=5; address=14;
#20
#20
$display("Reading operation");
#20 oe=1; wr=0;
#20 address=10;
#20 address=11;
#20 address=12;
#20 address=13;
#20 address=14;
#20
#20
$finish;
  end
  assign data=!oe ? tb_data: 8'hz;
endmodule
assign data=!oe ? tb_data: 8'hz;
