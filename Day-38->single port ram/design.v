module single_port_ram(clk,cs, wr, oe, address, data);
parameter DATA_WIDTH=8;
parameter ADDR_SIZE=4;
parameter DEPTH=16;

input clk,cs, wr,oe;
input [ADDR SIZE-1:0] address;
inout [DATA_WIDTH-1:0] data;
reg [DATA_WIDTH-1:0] tmp_data;
reg [DATA_WIDTH-1:0] mem [DEPTH];//RAM declaration
always @(posedge clk) begin //Writing
if (cs && wr) begin
  mem [address]=data;
end
end
always @(posedge clk)begin //Reading
if (cs && !wr)begin 
  tmp_data=mem[address];
end
end
assign data=cs && oe && !wr ? tmp_data: 8'hz;
endmodule
