`timescale 10ns/1ps
module MOD_N_COUNTER_TB;
	
  parameter N = 16;
  parameter WIDTH = 4;

  reg clk,reset;
  wire [WIDTH-1:0] out;

  MOD_N_COUNTER DUT(.clk(clk),
                    .reset(reset),
                    .out(out));
	        
always #5 clk = ~clk;
  
  initial
    begin
      clk=0;
      reset = 0;
      #15;
      reset = 1; 
      
      #200 $finish;
    end
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
endmodule
