module tffusingsr_jk_d(
    input clk, reset, T,
    output Q_sr, Q_jk, Q_d
    );
    wire w1, w2, w3;
    
    assign w1= T & (~Q_sr);
    assign w2= T & Q_sr;
    srff SR(clk, reset, w1, w2, Q_sr);
    
    jkff JK(T, T, clk, reset, Q_jk);
    
    assign w3= T ^ Q_d;
    dff D( clk, reset,w3, Q_d);
    
endmodule
