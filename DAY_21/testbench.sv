`timescale 10ns/1ps

module SR_LATCH_TB;

reg R, S, E;
wire Q, Qbar;

  SR_latch DUT(E,R,S,Q,Qbar);

initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    R=1'b0;
    S=1'b0;
    
   
    E=1'b1;
    
#5  S=1'b1;
#5  S=1'b0;
#5  R=1'b1;
#5  R=1'b0;
    
    E=1'b0;
    
#5  S=1'b1;
#5  S=1'b0;
#5  R=1'b1;
#5  R=1'b0;
#5  $finish;
  end
endmodule
