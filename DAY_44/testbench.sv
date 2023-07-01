// Code your testbench here
// or browse Examplesmodule fsm1_tb;
 module fsm1_tb;	
	        reg clk, reset;
	        wire [3:0] state;
	        wire out1, out2;
FSM1 DUT (
  .clk(clk), 
  .reset(reset),
  .STATE(state), 
  .out1(out1), 
  .out2(out2)
);
	
   

always #5 clk = ~clk;
   
initial 
  begin
     clk = 0;
     reset = 1;
     #10 reset = 0;
    #200 $finish;
   end
   
   
initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars;
   end
              
endmodule
