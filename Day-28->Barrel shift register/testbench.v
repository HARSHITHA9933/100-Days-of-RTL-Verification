`include "barrel_shifter.v"
module tb_barrel_shifter;

  reg [3:0] in;
  reg [1:0] shift;
  wire [3:0] out;

  barrel_shifter uut(.in(in), .shift(shift), .out(out));
  initial begin
    $monitor("Time=%t in=%b shift=%b out=%b",$time,in,shift,out);

    in=4'b1101; shift=2'b00;
    #10;
    shift=2'b01;
    #10;
    shift=2'b10;
    #10;
    shift=2'b11;
    #10;

    in=4'b1010;
    shift=2'b00;
    #10;
    shift=2'b01;
    #10;
    shift=2'b10;
    #10;
    shift=2'b11;
    #10
    $finish;
  end
endmodule
