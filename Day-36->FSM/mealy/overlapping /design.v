module melay_1010_design(clk,reset,in,out);
  input clk,reset,in;
  output reg out;
  parameter A=0, B=1, C=2, D=3;
  bit [1:0] state;
  always @(posedge clk or negedge reset) begin
    if(!reset) begin state<=A; out<=0; end
    else begin
      case(state)
        A:begin
          if(in==1) begin state<=B; out<=0; end
          else  begin state<=A; out<=0; end
        end
        B:begin
          if(in==1) begin state<=B; out<=0; end
          else  begin state<=C; out<=0; end
        end
        C:begin
          if(in==1) begin state<=D; out<=0; end
          else  begin state<=A; out<=0; end
        end
        D:begin
          if(in==1) begin state<=B; out<=0; end
          else  begin state<=C; out<=1; end
        end
        default:begin state<=A; out=0; end
      endcase
    end
  end
endmodule
