module divisibleby5(
    input clk,
    input reset,
    input in,
    output reg out
);

    // Parameters for state encoding
    parameter a=0, b=1, c=2, d=3, e=4;
    
    // State register
    reg [2:0] state;
    
    // State transition logic
    always @(posedge clk or negedge reset) begin
        if (!reset)
            state <= a;
        else begin
            case(state)
                a: state <= in ? b : a;
                b: state <= in ? d : c;
                c: state <= in ? a : e;
                d: state <= in ? c : b;
                e: state <= in ? e : d;
                default: state <= a;
            endcase
        end
    end
    
    // Output logic
    always @* begin
        case(state)
            a: out = 1;
            default: out = 0;
        endcase
    end
    
endmodule
