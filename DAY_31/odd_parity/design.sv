`timescale 10ns/1ps

module odd_parity(
  				   input [2:0] data,
                   output odd_p
					);
	     
  
  assign odd_p = ~(data[0]^data[1]^data[2]);


endmodule