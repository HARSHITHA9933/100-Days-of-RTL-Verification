module barrel_shifter(
  input [3:0] in,
  input [1:0] shift,
  output [3:0] out
);

  assign out[0] = (shift == 2'b00) ? in[0]:
                  (shift == 2'b01) ? in[1]:
                  (shift == 2'b10) ? in[2] : in[3];
  assign out[1] = (shift == 2'b00) ? in[1]:
                  (shift == 2'b01) ? in[2]:
                  (shift == 2'b10) ? in[3] : in[0];
  assign out[2] = (shift == 2'b00) ? in[2]:
                  (shift == 2'b01) ? in[3]:
                  (shift == 2'b10) ? in[0] : in[1];
  assign out[3] = (shift == 2'b00) ? in[3]:
                  (shift == 2'b01) ? in[0]:
                  (shift == 2'b10) ? in[1] : in[2];
endmodule
