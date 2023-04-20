// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module DUT;

  reg  A_input, B_input, C_input;
  wire Sum, C_output;  


  full_adder FA_DUT(.A(A_input), .B(B_input), .Cin(C_input), .S(Sum), .Cout(C_output));

  initial
    begin
      $dumpfile("xyz.vcd");
      $dumpvars;
      A_input=0;
      B_input=0;
      C_input=0;
       #100 $finish;
    end

always #40 A_input = ~A_input;
always #20 B_input = ~B_input;
always #10 C_input = ~C_input;


  always @(A_input or B_input or C_input)
      
    $monitor("At TIME(in ns)=%t, A=%d B=%d C=%d Sum = %d Carry = %d", $time, A_input, B_input, C_input, Sum, C_output);

endmodule
