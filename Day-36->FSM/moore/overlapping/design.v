module moore_101_design(clk,reset,in,out);
  input clk,reset,in;
  output reg out;
  parameter A=0, B=1, C=2, D=3;
  bit [1:0] state;
  always @(posedge clk or negedge reset) begin
    if(!reset) state<=A; 
    else begin
      case(state)
        A:state=in?B:A;
        B:state=in?B:C;
        C:state=in?D:A;
        D:state=in?B:C;
        default:state<=A;
      endcase
    end
  end
  always @* begin
    case(state)
      D:out=1;
      default:out=0;
    endcase
  end
endmodule
