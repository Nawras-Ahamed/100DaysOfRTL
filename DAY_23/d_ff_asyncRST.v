`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:28 05/27/2023 
// Design Name: 
// Module Name:    d_ff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module d_ff(clk, d, rst, q, qbar);
    input clk;
    input d;
    input rst;
    output reg q;
    output qbar;
	 
	 
always @ (posedge clk or negedge rst)
	begin
       if (!rst)
          q <= 0;
       else
          q <= d;
	end
	
assign qbar = ~q;

endmodule
