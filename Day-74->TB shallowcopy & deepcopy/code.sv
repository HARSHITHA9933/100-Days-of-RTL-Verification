class packet;
  int a;
  int b;
  function packet copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
  endfunction
endclass
class packet2;
  int c;
  packet pkt = new();
  function packet2 copy();
    copy = new();
    copy.c = this.c;
    copy.pkt = pkt.copy;
    return copy;
  endfunction
endclass
packet2 pl, p2;
module test;
  initial begin
    p1 = new;
    pl.c = 1;
    pl.pkt.a = 2;
    pl.pkt.b = 3;
    //pl.copy;
    $display("pl.pkt.a=%0d pl.pkt.b=%0d pl.c=%0d",pl.pkt.a,pl.pkt.b,pl.c);
    p2 = new pl;
    $display("-----after shallow copy-----");
    $display("p2.pkt.a=%0d p2.pkt.b=%0d p2.c=%0d",p2.pkt.a,p2.pkt.b,p2.c);
    p2.pkt.a = 8;
    p2.pkt.b = 21;
    p2.c = 19;
    $display("pl.pkt.a=%0d pl.pkt.b=%0d pl.c=%0d",pl.pkt.a,pl.pkt.b,pl.c);
    $display("p2.pkt.a=%0d p2.pkt.b=%0d p2.c=%0d",p2.pkt.a,p2.pkt.b,p2.c);
    p2 = p1.copy;
    // p2 =new pl;
    //p2.pkt-new pl.pkt;
    $display("AFTER DEEPCOPY.........");
    $display("p2.pkt.a=%0d p2.pkt.b=%0d p2.c=%0d",p2.pkt.a,p2.pkt.b,p2.c);
    $display("pl.pkt.a=%0d pl.pkt.b=%0d pl.c=%0d",pl.pkt.a,pl.pkt.b,pl.c);
  end
endmodule
