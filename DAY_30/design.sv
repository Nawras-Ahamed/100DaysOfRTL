`timescale 10ns/1ps 
module ODD_COUNTER (
	  				input wire  clk, reset,
       				output reg[7:0] out
					);

always @(posedge clk or posedge reset)
	    if (reset)
	      out <= 8'h1;
	    else
	      out <= out + 8'h2;

endmodule