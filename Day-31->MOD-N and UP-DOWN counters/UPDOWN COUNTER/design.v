module updown(load,up,din,clk,out);
  input wir load,clk,up;
  input wire [3:0] din;
  output reg [3:0] out=4'b0000;
  always @(posedge clk) begin
    if(load==1) begin
      out=din;
    end
    else if(up) begin
      out=out+1;
    end
    else begin
      out=out-1;
    end
  end
endmodule
