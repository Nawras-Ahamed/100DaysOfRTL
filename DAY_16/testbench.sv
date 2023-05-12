// Code your testbench here
// or browse Examples
`timescale 10ns/1ps


module bcd_2_xs3_tb;
  
  wire [3:0] xs;
  reg [3:0] bcd;

  bcd_2_xs3 DUT(.bcd(bcd),.xs(xs));
  
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
 
  initial 
    begin
           #10   bcd=4'b0000;
	       #10   bcd=4'b0001;
	       #10   bcd=4'b0010;
	       #10   bcd=4'b0011;
	       #10   bcd=4'b0100;
	       #10   bcd=4'b0101;
	       #10   bcd=4'b0110;
	       #10   bcd=4'b0111;
	       #10   bcd=4'b1000;
	       #10   bcd=4'b1001;
	       #10   bcd=4'b1010;
	       #10   bcd=4'b1011;
	       #10   bcd=4'b1100;
	       #10   bcd=4'b1101;
	       #10   bcd=4'b1110;
	       #10   bcd=4'b1111;
    
  end
   
endmodule