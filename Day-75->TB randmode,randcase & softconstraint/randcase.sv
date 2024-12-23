module test;
initial begin
  repeat (10) begin
    randcase
      40: $display("studyhard");
      10: $display("sleepingtime");
      30: $display("joinchipedge");
      20: $display("eatingtime");
    endcase
  end
end
endmodule
