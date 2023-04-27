`timescale 1ns/1ps

module DMUX_1X8_TB;
  
  DMUX_1X8 DUT(.y(y), 
              .s(s),
              .i(i));
  
  reg i;
  reg [2:0] s;
  
  initial 
    begin 
      $dumpfile("waveform.vcd");
      $dumpvars;
      
      i = 1;
      
      $monitor($time,"s=%d I=%b y=%d",s,i,y);
      
    end
  
  initial 
  begin
    s=3'b000;
    repeat(7)
      begin
        #100 s=s+1; //adds to  111 exits the repeat block 
      end
  #100 $finish;
  end
    endmodule