 `timescale 10ns / 1ps
	
//using structural Modelling
module Binary_to_Gray(
	    				input [3:0] b,       
	    				output reg[3:0] g  
  
	    				);
  
 	 xor A1(g[0],b[1],b[0]); 
  
	 xor A2(g[1],b[2],b[1]); 
  
	 xor A3(g[2],b[3],b[2]);
  
	 buf A4(g[3],b[3]);
  
endmodule