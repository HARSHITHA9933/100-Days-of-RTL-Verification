module prime_number(input [31:0] number, output reg prime);
  integer i;
  always @(number) begin
    if(number<2) begin
      prime=0;
    end
    else begin
      prime=1;
      for(i=2;i*i<=number;i=i+1) begin
        if(number%i==0) begin
          prime=0;
          break;
        end
      end
    end
  end
endmodule
