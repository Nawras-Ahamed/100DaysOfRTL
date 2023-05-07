 `timescale 10ns / 1ps
	
//using Behavioural Modelling
module Binary_to_Gray(
	    				input [3:0] b,       
	    				output reg[3:0] g  
  
	    				);
      
always@(b)
	 begin
       g[0]=b[1]^b[0];   
       g[1]=b[2]^b[1];
       g[2]=b[3]^b[2];
       g[3]=b[3];
	 end
endmodule