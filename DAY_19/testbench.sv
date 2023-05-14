`timescale 10ns/1ps

module alu_tb;
  
  reg [7:0] A,B;
  reg [3:0] opcode;
  wire z_flag;
  wire carry_flag;
  wire [15:0] out;
  integer i;
  
  ALU alu(.A(A),.B(B),.out(out),.carry_flag(carry_flag),.z_flag(z_flag),.opcode(opcode));
  
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  initial
    begin
      opcode = 4'b0;
      A	    = 8'b0;
      B     = 8'b0;
      
      #100;
      
      A = 8'h69;
      B = 8'h35;
      
      for(i = 0 ; i < 16 ; i=i+1'b1)
        begin
          opcode = i ;
          #50;
        end
    end
endmodule
      