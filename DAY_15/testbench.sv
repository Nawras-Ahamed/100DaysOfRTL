`timescale 10ns/1ps

module gray_to_binary_tb;
  
  reg [3:0]g;

  wire [3:0]b;
	      
   initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  
  gray_to_binary DUT(.b(b),
                     .g(g));
  
	initial 
      begin
           #10   g=4'b0000;
	       #10   g=4'b0001;
	       #10   g=4'b0011;
	       #10   g=4'b0010;
	       #10   g=4'b0100;
	       #10   g=4'b0101;
       	   #10   g=4'b0110;
           #10   g=4'b0111;
	       #10   g=4'b1000;
	       #10   g=4'b1001;
	       #10   g=4'b1010;
	       #10   g=4'b1011;
	       #10   g=4'b1100;
	       #10   g=4'b1101;
	       #10   g=4'b1110;
	       #10   g=4'b1111;
	  end
  
endmodule
 


