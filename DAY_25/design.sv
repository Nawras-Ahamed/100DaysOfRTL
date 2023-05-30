`timescale 10ns/1ps

module JK_ff(input J,K,clk,RST,
             output reg Q
             );
	
always@(negedge clk)
    begin
      if(RST)
        Q <= 1'b0;
      else  
        begin
        case({J,K})
          2'b00: Q <= Q;
          2'b01: Q <= 1'b0;
          2'b10: Q <= 1'b1;
          2'b11: Q <= ~Q;
        endcase
      end          
	end
endmodule
	
module async_4bit_count(input J,K,clk,RST,
                        output [3:0]q
                        );

    JK_ff JK1(J,K,clk,RST,q[0]);
	JK_ff JK2(J,K,q[0],RST,q[1]);
	JK_ff JK3(J,K,q[1],RST,q[2]);
	JK_ff JK4(J,K,q[2],RST,q[3]);
  
endmodule