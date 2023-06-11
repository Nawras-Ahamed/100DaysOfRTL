module ring_counter_tb;
 
  reg clk;
  reg reset;
  wire [3:0] out;
  	    
  ring_counter DUT(.clk(clk), 
                   .reset(reset), 
                   .out(out)
                  );
	
always #10 clk = ~clk;
  
initial 
  begin
    clk = 0;
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    reset = 0;
    
    #50 reset = 1;

   #300 $finish;
	    
  end

endmodule