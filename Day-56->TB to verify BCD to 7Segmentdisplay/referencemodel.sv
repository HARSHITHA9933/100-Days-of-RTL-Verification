class refmodel;
  transaction wrmon_data;
  mailbox #(transaction) wr2ref;
  mailbox #(transaction) ref2scr;
  function new (mailbox #(transaction)wr2ref, mailbox # (transaction) ref2scr);
    this.wr2ref=wr2ref;
    this.ref2scr=ref2scr;
  endfunction
  virtual task ref_logic(transaction wrmon_data);
    case (wrmon_data.bcd)
            4'b0000:  wrmon_data.seg = 7'b1111110;  // 0
            4'b0001:  wrmon_data.seg = 7'b0110000;  // 1
            4'b0010:  wrmon_data.seg = 7'b1101101;  // 2
            4'b0011:  wrmon_data.seg = 7'b1111001;  // 3
            4'b0100:  wrmon_data.seg = 7'b0110011;  // 4
            4'b0101:  wrmon_data.seg = 7'b1011011;  // 5
            4'b0110:  wrmon_data.seg = 7'b1011111;  // 6
            4'b0111:  wrmon_data.seg = 7'b1110000;  // 7
            4'b1000:  wrmon_data.seg = 7'b1111111;  // 8
            4'b1001:  wrmon_data.seg = 7'b1111011;  // 9
            default:  wrmon_data.seg = 7'b0000000;  // Turn off all segments for invalid inputs
    endcase
  endtask
virtual task start();
      forever 
        begin
        wrmon_data=new();
        wr2ref.get(wrmon_data);
          ref_logic(wrmon_data);
          ref2scr.put(wrmon_data);
          wrmon_data.display("refmodell");
        end
  endtask
endclass
