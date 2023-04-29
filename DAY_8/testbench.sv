`timescale 1ns/1ps

module BCD_ADDER_TB;
  
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
  
    // Outputs
    wire [3:0] sum;
    wire carry;

    BCD_ADDER DUT(
        .a(a), 
        .b(b), 
        .c_in(c_in), 
        .sum(sum), 
        .carry(carry)
    );

    initial 
      begin
        $dumpfile("waveform.vcd");
        $dumpvars;
      end 
  
  initial 
    begin 
        a = 0;  b = 0;  c_in = 0;   #100;
        a = 4;  b = 8;  c_in = 1;   #100;
        a = 4;  b = 1;  c_in = 0;   #100;
        a = 6;  b = 9;  c_in = 1;   #100;
        a = 6;  b = 9;  c_in = 0;   #100; 
        a = 8;  b = 2;  c_in = 0;   #100;
        a = 8;  b = 2;  c_in = 1;   #100;
        a = 9;  b = 9;  c_in = 1;   #100;
    end 
endmodule
