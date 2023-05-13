`timescale 1ns/10ps

module clock( input enable,
             output reg clk);
  
parameter FREQ = 100000; //khz
parameter PHASE = 0;
parameter DUTY = 50;
  
  real CLK_PERIOD = 1/(FREQ * 1e3) * 1e9; //to time scale and in ns
  real CLK_ON	  = DUTY/CLK_PERIOD *100;
  real CLK_OFF	  = ((100-DUTY)/CLK_PERIOD) * 100 ;
  
  
  reg clk_enabled;
  
  initial begin
    clk<=0;
    clk_enabled=0;
  end
  
  
  always@(posedge enable)
    begin
      if(enable)
        clk_enabled=1;
      else
        clk_enabled=0;
    end
  
  
  always@(posedge clk_enabled)
  begin
            if(clk_enabled)
	begin
	clk=1;
    	while (clk_enabled)
          		begin
         		   #(CLK_ON) clk = 0;
            		  #(CLK_OFF) clk = 1;
          		end
	clk=0;
    	end 
   end

endmodule
  