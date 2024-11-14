class refmodel;
  transaction wrmon_data;
  mailbox #(transaction) wr2ref;
  mailbox #(transaction) ref2scr;
  function new (mailbox #(transaction)wr2ref, mailbox # (transaction) ref2scr);
    this.wr2ref=wr2ref;
    this.ref2scr=ref2scr;
  endfunction
   // Function to calculate sum bit (XOR of 3 inputs)
  function bit calc_sum(bit a, bit b, bit c);
    return a ^ b ^ c;
  endfunction 
  // Function to calculate carry bit (majority function using AND and OR)
  function bit calc_carry(bit a, bit b, bit c);
    return (a & b) | (b & c) | (c & a);
  endfunction
  virtual task ref_logic(transaction wrmon_data);
     bit c0, c1, c2, c3; // Temporary carry bits
  // First stage
      wrmon_data.sum[0] = calc_sum(wrmon_data.a[0], wrmon_data.b[0], wrmon_data.cin);
     c0 = calc_carry(wrmon_data.a[0], wrmon_data.b[0], wrmon_data.cin);  
      // Second stage
    wrmon_data.sum[1] = calc_sum(wrmon_data.a[1], wrmon_data.b[1], c0);
    c1= calc_carry(wrmon_data.a[1], wrmon_data.b[1], c0);  
      // Third stage
    wrmon_data.sum[2] = calc_sum(wrmon_data.a[2], wrmon_data.b[2], c1);
    c2 = calc_carry(wrmon_data.a[2], wrmon_data.b[2],c1);   
      // Fourth stage
    wrmon_data.sum[3] = calc_sum(wrmon_data.a[3], wrmon_data.b[3], c2);
    carryout = calc_carry(wrmon_data.a[3], wrmon_data.b[3], c2);
     //    bit c0, c1, c2, c3; // Temporary carry bit
   
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
