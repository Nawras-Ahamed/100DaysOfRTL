`timescale 10ns/1ps
module Binary_to_Gray_tb;
  
  reg [3:0]b;

  wire [3:0]g;

	      
   initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  
  Binary_to_Gray DUT(.b(b),
                     .g(g));
  
	initial 
      begin
           #10   b=4'b0000;
	       #10   b=4'b0001;
	       #10   b=4'b0010;
	       #10   b=4'b0011;
	       #10   b=4'b0100;
	       #10   b=4'b0101;
	       #10   b=4'b0110;
	       #10   b=4'b0111;
	       #10   b=4'b1000;
	       #10   b=4'b1001;
	       #10   b=4'b1010;
	       #10   b=4'b1011;
	       #10   b=4'b1100;
	       #10   b=4'b1101;
	       #10   b=4'b1110;
	       #10   b=4'b1111;
	  end
endmodule
 


