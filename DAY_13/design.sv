`timescale 10ns/1ps

module priority_8X3(input [7:0] din,
					output reg [2:0] dout
                    );// behavioral modellling 
always @(din)
	begin
    	if (din ==8'b00000001) dout=3'b000;
    	else if (din==8'b0000001X) dout=3'b001;
    		else if (din==8'b000001XX) dout=3'b010;
    			else if (din==8'b00001XXX) dout=3'b011;
    				else if (din==8'b0001XXXX) dout=3'b100;
    					else if (din ==8'b001XXXXX) dout=3'b101;
    						else if (din==8'b01XXXXXX) dout=3'b110; 
    							else if (din==8'b1XXXXXXX) dout=3'b111; 
    	else dout=3'bX;
	end
endmodule
