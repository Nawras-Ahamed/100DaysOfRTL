`timescale 10ns / 1ps

module JKFF_tb_v;

	// Inputs
	reg J;
	reg K;
	reg RST;
	reg clk;

	// Outputs
	wire q;
	wire qb;

	// Instantiate the Unit Under Test (UUT)
	JK_FF1 uut (
		.J(J), 
		.K(K), 
		.RST(RST), 
		.clk(clk), 
		.q(q), 
		.qb(qb)
	);

always #10 clk = ~clk;

		initial 
  begin
    clk=0;
    RST=0;
    #3 RST=1;
  end
	
	
initial 
	begin
		#10 J <= 0;
			 K <= 0;

      #20 J <= 0;
          K <= 1;
      #20 J <= 1;
          K <= 0;
      #20 J <= 1;
          K <= 1;
	 end
endmodule

