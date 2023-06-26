module Endianess(input [31:0]data_in,
                 output[31:0]little_e,
                 output[31:0]big_e
				 );
		
assign little_e = {data_in[7:0],data_in[15:8],data_in[23:16],data_in[31:24]};
assign big_e = {data_in[31:24],data_in[23:16],data_in[15:8],data_in[7:0]};
	
endmodule