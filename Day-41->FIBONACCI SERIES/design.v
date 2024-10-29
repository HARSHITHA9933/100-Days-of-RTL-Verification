module fibonacci #(parameter N = 10)(
    input wire clk, rst,
    output reg [3:0] out
);
    reg [3:0] out1 [0:N-1];
    integer i;
    always @(posedge rst) begin
        out1[0] = 1;
        out1[1] = 1;
        for (i = 2; i < N; i = i + 1) begin
            out1[i] = out1[i-1] + out1[i-2];
        end
        i = 0; 
    end
    always @(posedge clk) begin
        if (i < N) begin
            out = out1[i];
            i = i + 1;
        end
    end
endmodule
