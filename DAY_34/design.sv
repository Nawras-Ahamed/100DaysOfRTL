`timescale 100ns/100ns

module clock_divider #(parameter N=500) (
  											input clk, rst,
    										output reg clk_out
    										);
	
localparam FIXED_OUT = ((N/2)- 1);
  
  
reg [31:0] count;
  
wire COMPARATOR_OUT;

assign COMPARATOR_OUT = (count == FIXED_OUT);	

always @ (posedge clk , posedge rst) //synchronous reset
		begin
    	if (rst) 
          count <= 0;
        else if (COMPARATOR_OUT) 
          count <= 0;		// Resets the counter when FIXED OUT is reached
        else 
          count <= count + 1; 
		end

  always @ (posedge clk, posedge rst)
begin
    if (rst) 
      clk_out <= 0;
    else if (COMPARATOR_OUT) 
      clk_out <= !clk_out;	
// T-FF with COMPARATOR_OUT as input signal or can be inferred as an DFF with COMPARATOR_OUT  as the control signal for the ENABLE.
    else
        clk_out <= clk_out; //to avoid inferred latch
end
endmodule

