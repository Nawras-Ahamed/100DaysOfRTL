`timescale 10ns/1ps
module MOD_N_COUNTER #(parameter N=16,parameter WIDTH=4)
	        		(input clk,reset,
	        		 output reg [WIDTH-1:0] out
                    );

always@(posedge clk)
  
  begin
    if(!reset)
      out <= 0;
    else
      if(out == N-1)
        out <= 0;
    else
      out <= out + 1;
  end              
endmodule

