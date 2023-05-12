// Code your testbench here
// or browse Examples
`timescale 10ns/1ps


module bin2bcd_tb;
  
  wire [3:0] bcd;
  reg [3:0] bin;

  bin2bcd DUT(.bin(bin),.bcd(bcd));
  
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
 
  initial 
    begin
           #10      bin=4'b0000;
	       #10      bin=4'b0001;
	       #10      bin=4'b0010;
	       #10      bin=4'b0011;
	       #10      bin=4'b0100;
	       #10      bin=4'b0101;
	       #10      bin=4'b0110;
	       #10      bin=4'b0111;
	       #10      bin=4'b1000;
	       #10      bin=4'b1001;
	       #10      bin=4'b1010;
	       #10      bin=4'b1011;
	       #10      bin=4'b1100;
	       #10      bin=4'b1101;
	       #10   	bin=4'b1110;
	       #10      bin=4'b1111;
    
  end
   
endmodule