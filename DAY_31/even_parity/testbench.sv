`timescale 10ns / 1ps

module tb_even_parity;
	
  reg [2:0] data;
  wire even_p;
  integer i;
	
even_parity DUT(
    			.data(data), 
    			.even_p(even_p)
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