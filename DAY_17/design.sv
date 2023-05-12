// Code your design here
`timescale 10ns/1ps

module bin2bcd(input [3:0] bin,
                 output reg [4:0] bcd
                );
  
  always@(bin)
    
    begin
      bcd[0] = bin [0];
      bcd[1] = (bin[3] & bin[2] & ~bin[1]) | (~bin[3] & bin[1]);
      bcd[2] = (~bin[3] & bin[2]) | (bin[2] & bin[1]);
      bcd[3] = bin[3] & ~bin[2] & ~bin[1];
      bcd[4] = (bin[3] & bin[2] ) | (bin[3] & bin[1]); 
    end
  
endmodule