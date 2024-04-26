module Fixed_Priority_Arbiter_TB;
  
  reg          CLK;
  reg          RST;
  reg [3:0]    REQ;
  wire [3:0]   GNT;
  
  FPA  DUT(.CLK(CLK), 
           .RST(RST), 
           .REQ(REQ), 
           .GNT(GNT) );
  
  always #5 CLK = ~CLK;
 
  initial
    begin
      CLK = 0;
      RST = 0;
      REQ = 4'b0;

      #5 RST = 1;
      @(negedge CLK) REQ = 4'b0101;
      @(negedge CLK) REQ = 4'b0011;
      @(negedge CLK) REQ = 4'b1110;    
      @(negedge CLK) REQ = 4'b1010;
      @(negedge CLK) REQ = 4'b0010;
      @(negedge CLK) REQ = 4'b0100;
      @(negedge CLK) REQ = 4'b0010;
      @(negedge CLK) REQ = 4'b0110;
      @(negedge CLK) REQ = 4'b1110;
      @(negedge CLK) REQ = 4'b1111;


      #10 RST = 0;    
      #100 $finish;
  end  
   initial 
     begin
      $dumpfile("dump.vcd");
      $dumpvars();
     end  
endmodule
    