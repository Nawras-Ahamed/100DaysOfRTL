`timescale 10ns / 1ps

module JK_FF1( input J,K,RST,clk,
					output reg q,
					output qb
								);
   
always@(posedge clk or negedge RST)
begin
	if(!RST)
		q <= 0;
		else
			begin
				case ({J,K})
					2'b00 :  q <= q;
					2'b01 :  q <= 0;
					2'b10 :  q <= 1;
					2'b11 :  q <= ~q;
				endcase
			end
end
assign qb = ~q;
endmodule
