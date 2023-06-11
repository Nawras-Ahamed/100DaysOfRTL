 module johnson_counter(
	    				input clk,
	   					input reset,
	    				output reg [3:0] out
					);
	
always @(posedge clk) 
     begin
       if (!reset) 
          begin
	        out <= 4'b0000;// since its a self starting counter
	      end 
       else 
         begin
           out <= {~out[0],out[3:1]}; //OUTPUT OF NTH FF IS INVERTED AND FEDBACK TO FIRST FF
	    end
	end

endmodule


// mod number = 2n
// maximum count = 2^(n)-1
// output frequency =  fclk/mod_number --> fclk/2n