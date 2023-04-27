`timescale 1ns/1ps

module MUX_8X1(output reg y,
               input wire [7:0]i,
               input wire [2:0]s);
  always@(s)
    begin
      case(s)
        
        3'b000:y= i[0];

        3'b001:y= i[1];

        3'b010:y= i[2];

        3'b011:y= i[3];

        3'b100:y= i[4];
        
        3'b101:y= i[5];

        3'b110:y= i[6];

        3'b111:y= i[7];

        default: y= 1'bx;

      endcase

    end

endmodule
