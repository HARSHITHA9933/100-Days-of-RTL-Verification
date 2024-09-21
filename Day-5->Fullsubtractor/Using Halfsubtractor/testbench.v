module full_sub_half_tb(a,b,cin,difference,borrow);
  input wire difference,borrow;
  output reg a,b,cin;
  full_sub dut(a,b,cin,difference,borrow);
  initial begin
    $monitor("Time=%0t a=%0b b=%0b cin=%0b difference=%0b borrow=%0b",$time,a,b,cin,difference,borrow);
    #5 a=0;b=0;cin=0;
    #5 a=0;b=0;cin=1;
    #5 a=0;b=1;cin=0;
    #5 a=0;b=1;cin=1;
    #5 a=1;b=0;cin=0;
    #5 a=1;b=0;cin=1;
    #5 a=1;b=1;cin=0;
    #5 a=1;b=1;cin=1;
    #5;
  end
endmodule
