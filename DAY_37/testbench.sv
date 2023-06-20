module tb_sipo;
	
	    
  reg data_in;
  reg clk;
  reg rst;
  wire [3:0] data_out;

 
  sipo DUT (
    .data_in(data_in), 
    .clk(clk), 
    .rst(rst), 
    .data_out(data_out)
  			);
	
  
always #5 clk = ~clk;
  
  initial 
    begin
      data_in = 0;
      clk = 0;
      rst = 1;
      #30;
      rst=0;
      $dumpfile("dump.vcd");
      $dumpvars;
      #100 $finish;
      
      
    end
  
always
	begin
      data_in = $random;
      #10;
    end
	    
	  
endmodule