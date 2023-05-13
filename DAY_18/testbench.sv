`timescale 1ns/1ps
module clock_tb;
  
  wire clock_1;
  wire clock_2;
  reg enable;
  reg [7:0] enable_delay;
  
  clock dut1(.enable(enable),
             .clk(clock_1));
  clock #(.FREQ(50000)) dut2(.enable(enable),
                             .clk(clock_2));
  
  initial begin
    enable = 0;
    $dumpfile("dump.vcd");
  	$dumpvars;
  end
  
  initial 
    begin
      enable_delay = $random;
      for(int i = 0; i<8;i=i+1)
        begin
          #(enable_delay) enable = ~enable;
        end
    #100 $finish;
    end
  
endmodule
    
  
  