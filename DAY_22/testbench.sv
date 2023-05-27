`timescale 10ns/1ps

module SR_FF_TB;
  
reg clk,S,R,RST;
wire Q,Qbar;
  
  SR_FF DUT(clk,S,R,RST,Q,Qbar);
  
always #5 clk = ~clk;
  
initial 
  begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
initial 
  begin
    clk=0;
    RST=0;
    #3 RST=1;
  end
  
/*initial 
begin
	clk = 0;
	forever #5 clk = ~clk;
end*/
  
 initial 
   begin 
     S = 0;
     R = 0;
     #20;
     S = 0;
     R = 1;
     #20;
     S = 1;
     R = 0;
     #20;
     S = 1;
     R = 1;
     #20;
   end
  
endmodule

