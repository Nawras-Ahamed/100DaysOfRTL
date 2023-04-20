// Code your design here
`timescale 1ns / 1ps 
module full_adder( A, B, Cin, S, Cout);

 input wire A, B, Cin;
 output reg S, Cout;

 always @(A or B or Cin)
  begin 
   S = A ^ B ^ Cin; 
   Cout = A&B | (A^B) & Cin; 
  end
endmodule