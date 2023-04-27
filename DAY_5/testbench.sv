`timescale 1ns/1ps

module RCA_TB;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
  
	// Outputs
	wire [3:0] s;
	wire cout;


	RCA DUT(
		.a(a), 
		.b(b), 
		.cin(cin), 
		.s(s), 
		.cout(cout)
	);

initial begin
  $dumpfile("waveform.vcd");
  $dumpvars;
		      a = 4'b0001;b = 4'b0100;cin=0;
		#100; a = 4'b0011;b = 4'b1001;cin=1;
		#100; a = 4'b1001;b = 4'b1100;cin=0;
	    #100; a = 4'b1111;b = 4'b1111;cin=1;
  
	end
  
initial 
  #400 $finish;
  
endmodule

