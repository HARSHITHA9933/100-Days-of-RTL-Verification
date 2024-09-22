module ripplecarryadder_tb(A,B,cin,S,C);
input wire A,B,cin;
output reg S,C;
  ripplecarryadder dut(A,B,cin,S,C);
  initial begin
    $monitor("Time=%0t A=%b B=%b cin=%b S=%b C=%b",A,B,cin,S,C);
    #1 A=4'b0010; B=4'b0001;
    #1 A=4'b1000; B=4'b1100;
  end
endmodule
    
