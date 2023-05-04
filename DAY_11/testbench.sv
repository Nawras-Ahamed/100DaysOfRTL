`timescale 10ns/ps

module encoder_tb;
  reg [7:0] d;
  encoder_8x3 DUT (.din(d), .dout(q));
initial 
  begin
  
    #10 d=8'b10000000;
    #10 d=8'b01000000;
    #10 d=8'b00100000;
    #10 d=8'b00010000;
    #10 d=8'b00001000;
    #10 d=8'b00000100;
    #10 d=8'b00000010;
    #10 d=8'b00000001;
    
    #10 $finish;
end
endmodule 