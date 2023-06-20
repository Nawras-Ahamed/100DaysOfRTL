`timescale 10ns/10ns

module PISO_TB;
  
  reg clk,clr,load;
  reg [7:0] data_in;
  
  wire data_out;
  
  
  PISO DUT(clk,clr,load,data_in,data_out);
  
   always #1 clk = ~clk;
  
  initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars;
    end
  
  initial 
    begin
      clk=0;
      clr=0;
      load=0;
      data_in=8'b00000000;
      
      
      #5 clr = 1;

      #10 load = 1; 
      
      
      data_in = 8'd15;
      #5 load = 0;

      #10 load = 1; 
      
      data_in = 8'd255;
      #5 load = 0;

      #10 load = 1; 
      
      data_in = 8'd128;
      #5 load = 0;

      #100 $finish;
    end
  
endmodule
  
