`timescale 1ns/1ps

module MUX_8X1_TB;
  
  MUX_8X1 DUT(.y(y),
              .s(s),
              .i(i));
  
  reg [7:0] i;
  reg [2:0] s;
  
  initial 
    begin 
      $dumpfile("waveform.vcd");
      $dumpvars;
      
      i = $random;
      
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