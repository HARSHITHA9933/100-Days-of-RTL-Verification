module prime_number_test;
  reg [31:0] number;
  wire prime;
  prime_number inst(number,prime);
  initial begin
    $monitor("Time=%0t=> number=%0d prime=%0d",$time,number,prime);
    #10 number=1;
    #10 number=2;
    #10 number=5;
    #10 number=23;
    #10 number=25;
    #10 number=39;
    #10 number=47;
    #10 number=61;
    #10 number=63;
    #10 number=89;
    #10 number=96;
    #100;
    $finish;
  end
endmodule
    
