 module ring_counter(
	    				input clk,
	   					input reset,
	    				output reg [3:0] out
					);
	
always @(posedge clk) 
     begin
       if (!reset) 
          begin
	        out <= 4'b0001;// since its not a self starting counter
	      end 
       else 
         begin
           out <= {out[2:0], out[3]}; // 1-->2-->4-->8-->1
	    end
	end

endmodule


// mod number = n
// maximum count = 2^(n-1)
// output frequency =  fclk/mod_number --> fclk/n