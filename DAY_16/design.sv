`timescale 10ns/1ps

module bcd_2_xs3(input [3:0] bcd,
                 output reg [3:0] xs
                );
  
  always@(bcd)
    begin
      xs[3]= ~ bcd[3];
      xs[2]= ~ (bcd[2] ^ bcd[3]);
      xs[1]= (~ bcd[2] & bcd[1]) |  (~ bcd[3] & bcd[1]) | (~ bcd[3] & bcd[1] & ~bcd[2]);
      xs[0]= bcd[0] | (bcd[1] & bcd[2]) | (bcd[1] & bcd[3]);
    end
  
endmodule