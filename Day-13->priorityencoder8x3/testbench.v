module priorityencoder8x3_tb;
reg [7 : 0] d;
wire bo,b1,b2;
priorityencoder8x3 dut (.d(d),.bo(bo),.bl (bl),.b2 (b2));
initial begin
d=8'b000000001;
#10;d=8'b0000001X;
#10;d=8'b000001XX;
#10;d=8'b00001XXX;
#10;d=8'b0001XXXX;
#10;d=8'b001XXXXX;
#10;d=8'b01XXXXXX;
#10;d=8'b1XXXXXXX;
#10;
$finish;
end
endmodule
