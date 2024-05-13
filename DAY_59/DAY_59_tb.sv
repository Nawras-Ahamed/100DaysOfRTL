module RR_arbiter__tb();
  reg clk;
  reg RST;
  reg [3:0] REQ;
  wire [3:0] GRANT;
  
  //Instantiate Design Under Test
  
  RR_arbiter DUT (.clk(clk), 
                          .RST(RST), 
                          .REQ(REQ), 
                          .GRANT(GRANT)
                         );
 
  always #5 clk = ~clk;
  
  initial 
  begin
    clk = 0;
    RST = 1;
    #5 RST= 0;
    REQ = 4'b0;
    $dumpvars;
    $dumpfile("dump.vcd");
    
    #5 RST = 1;
    
    @(negedge clk) REQ = 4'b1000;    
    @(negedge clk) REQ = 4'b1000;
    @(negedge clk) REQ = 4'b0001;
    @(negedge clk) REQ = 4'b1001;
    @(negedge clk) REQ = 4'b0010;
    @(negedge clk) REQ = 4'b1010;
    @(negedge clk) REQ = 4'b0010;
    @(negedge clk) REQ = 4'b0110;
    @(negedge clk) REQ = 4'b1110;
    @(negedge clk) REQ = 4'b1111;
    @(negedge clk) REQ = 4'b0100;
    @(negedge clk) REQ = 4'b0010;
    
    
    #100 $finish;
  end
  
endmodule 