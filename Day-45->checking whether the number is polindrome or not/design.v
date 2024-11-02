module polindrome(data,out);
  input wire [7:0] data;
  output reg out;
  reg [7:0] rev_data;
  always @(*) begin
    rev_data=8'b0;
    for(int i=0;i<8;i=i+1) begin
      rev_data[i]=data[7-i];
    end
    if(data==rev_data) begin
      out=1;
    end else begin
      out=0;
    end
  end
endmodule
