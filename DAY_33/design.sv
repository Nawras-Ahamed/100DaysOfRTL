`timescale 10ns/1ps

module gray_counter #(parameter N=8) (
  					input clk,reset,
  					output reg [N-1:0] out
										);
  
reg [N-1:0] q;

  
always@(posedge clk)
    begin
    	if(!reset)
          begin
			q <= 0;
      		out <= 0;
          end
            else
          		begin
          			q <= q + 1;
                end
 
      assign out = {
        			q[7],
                   (q[7] ^ q[6]),
                   (q[6] ^ q[5]),
                   (q[5] ^ q[4]),
                   (q[4] ^ q[3]),
                   (q[3] ^ q[2]),
                   (q[2] ^ q[1]),
                   (q[1] ^ q[0])
      }; //This method defeats the purpose of the gray counter itself hence a design based on FSM or a seperate register for gray_values in a feedback to the DFF of a Binary counter may serve the actual purpose of the design or idea.
      

   	end      
  
endmodule
