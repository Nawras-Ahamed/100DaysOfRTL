`timescale 100ns/100ns

module clock_divider_tb;
  
  reg clk,rst;
  wire clk_out;
  
  clock_divider #(.N(500)) DUT1 (.clk(clk),.rst(rst),.clk_out(clk_out));
  //clock_divider #(.N(100)) DUT2 (.clk(clk),.rst(rst),.clk_out(clk_out));
  always #5 clk = ~ clk; //10MHZ signal
  
  initial 
    begin
      clk = 0;
      rst = 1;
      #5 rst = 0;
      #10000 $finish;
    end
  
  
  initial 
    begin
  $dumpfile("dump.vcd");
      $dumpvars;
    end 
endmodule
      
      
      
      
     