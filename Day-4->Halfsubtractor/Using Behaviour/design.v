module half_sub(output reg d0, b0, input wire a,b);
  always @* begin
    d0=a^b;
    b0=~a&b;
  end
endmodule
