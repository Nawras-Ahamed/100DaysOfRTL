`timescale 1ns/1ps
module edge_detector_tb;
  
  reg signal;
  reg clk;
  reg reset;
  
  wire rising_edge , falling_edge;
  
  edge_detector DUT(.signal(signal),
                    .clk(clk),
                    .reset(reset),
                    .rising_edge(rising_edge),
                    .falling_edge(falling_edge)
                   );
  
  always #5 clk = ~clk;
  
  initial 
    begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial 
    begin 
      reset = 1;
      #5 reset = 0;
      clk <= 0;
      @(posedge clk);
      for(integer i=0; i < 10; i=i+1)
        begin
         signal <= $random % 2;
          @(posedge clk);
        end
  		#150 $finish;
    end
  
endmodule
          
          
      
      
