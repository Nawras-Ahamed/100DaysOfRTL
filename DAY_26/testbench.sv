`timescale 10ns/1ps

module async_4bit_count_tb;
  
	reg J,K,clk,RST;
	wire [3:0]q;
  
  
async_4bit_count DUT(J,K,clk,RST,q);
  
initial 
	begin 
	  J<=1'b0;
	  K<=1'b0;
	  RST=1;
	  clk=0;
      $dumpfile("waves.vcd");
      $dumpvars;
      forever #5 clk=~clk;
	end
  
initial 
  begin
	#20 
	RST<=0;
	J<=1'b1;
	K<=1'b1;
	#160 RST=1;
	#20
	RST<=0;
	#20
	$finish;
  end
  
endmodule