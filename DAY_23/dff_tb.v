`timescale 10ns / 1ps

module dff_tb_v;

	// Inputs
	reg clk;
	reg d;
	reg rst;

	// Outputs
	wire q;
	wire qbar;

	// Instantiate the Unit Under Test (UUT)
	d_ff uut (
		.clk(clk), 
		.d(d), 
		.rst(rst), 
		.q(q), 
		.qbar(qbar)
	);

always #10 clk = ~clk;

integer i;

initial 
	begin
    	clk <= 0;
    	d <= 0;
    	rst <= 0;
		
    	#10 d <= 1;
    	#15 rst <= 1;
		
    	for (i = 0; i < 5; i=i+1) 
			begin
				#15 d <= i;
			end
    end
      
endmodule

