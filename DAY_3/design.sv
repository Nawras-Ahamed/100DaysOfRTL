// Code your design here
`timescale 1ns / 1ps 
module MUX_4X1(s0,s1,a,b,c,d,out);
  input a,b,c,d,s0,s1;
  output reg out;
  
  
  always @ (*)
    begin
      case({s1,s0})
         2'b00 : out <= a;
         2'b01 : out <= b;
         2'b10 : out <= c;
         2'b11 : out <= d;
    	endcase
    end
endmodule