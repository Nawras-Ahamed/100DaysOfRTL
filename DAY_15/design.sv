`timescale 10ns/1ps

module gray_to_binary(input [3:0] g,
                      output reg [3:0] b
                     );
  
  always@(*)
    begin
      b[3] = g[3];
      b[2] = g[3] ^ g[2];
      b[1] = g[3] ^ g[2] ^ g[1];
      b[0] = g[3] ^ g[2] ^ g[1] ^ g[0];
    end
endmodule

      