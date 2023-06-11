`timescale 10ns/1ps

module even_parity(
  				   input [2:0] data,
                   output even_p
					);
	     
  
assign even_p = data[0]^data[1]^data[2];


endmodule