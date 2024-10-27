module dual_port_ram(clk,cs, we, re, oe, data_in, data_out, wr_address, rd_address);
parameter ADDR_SIZE=4;
parameter DATA_SIZE=8;
parameter DEPTH=16;

input clk,cs,we,re,oe;
input [DATA_SIZE-1:0] data_in;
input [ADDR_SIZE-1:0]wr_address;
input [ADDR_SIZE-1:0]rd_address:
output reg [DATA_SIZE-1:0]data_out;
reg [DATA_SIZE-1:0] tmp_data_out;

reg[DATA SIZE-1:0]mem[DEPTH];

always @(posedge clk)begin
 if (cs && we) begin mem [wr_address]<=data_in;
end
end
always @(posedge clk)begin

if(cs && re) begin tmp_data_out<=mem[rd_address];
end
end

assign data_out=cs&&re&&oe ? tmp_data_out:8'hz;
endmodule

