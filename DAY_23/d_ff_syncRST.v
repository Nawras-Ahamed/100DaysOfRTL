`timescale 10ns / 1ps


module d_ff(clk, d, rst, q, qbar);
  
  input clk;
 
   input d;
   
 input rst;
  
  output reg q;
   
 output qbar;
	 

always @ (posedge clk )
	begin
       if (!rst)
          q <= 0;
       else
          q <= d;
	end
	
assign qbar = ~q;

endmodule
