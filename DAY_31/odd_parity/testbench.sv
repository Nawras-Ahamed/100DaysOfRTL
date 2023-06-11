`timescale 10ns / 1ps

module odd_parity_tb;
	
  reg [2:0] data;
  wire odd_p;
  integer i;
	
odd_parity DUT(
    			.data(data), 
 				.odd_p(odd_p)
  				);

  initial 
    begin
      for(i=0;i<10;i=i+1) 
         #20 data=i;
    end

  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #220 $finish;
    end
	      
endmodule