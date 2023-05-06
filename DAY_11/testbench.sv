`timescale 10ns/1ps

module encoder_tb;
  
  reg [7:0] d;
  wire [2:0] q;
  
  encoder_8x3 DUT (.din(d), .dout(q));
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  
initial 
  begin
  
    #10 d =8'b10000000;
    #10 d =8'b01000000;
    #10 d =8'b00100000;
    #10 d =8'b00010000;
    #10 d =8'b00001000;
    #10 d =8'b00000100;
    #10 d =8'b00000010;
    #10 d =8'b00000001;
    
    #10 $finish;
end
endmodule 