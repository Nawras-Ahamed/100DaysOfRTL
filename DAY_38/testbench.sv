module PIPO_TB;

reg clk,clr;
reg [3:0] data_in;

wire [3:0] data_out;

PIPO DUT (clk,
             clr,
             data_in,
             data_out
            );

always #5 clk = ~clk;

initial 
  begin
      clk = 0;
      clr = 0;
      data_in = 0;

      #5 clr=1;
      #5 clr=0;

      #10 data_in=4'b1001;
      #10 data_in=4'b1010;
      #10 data_in=4'b1011;
      #10 data_in=4'b1110;
      #10 data_in=4'b1111;
      #10 data_in=4'b0000;
      #150 $finish;
  end



initial 
  begin
    $dumpfile("dump.vcd");
	$dumpvars;
  end 
  
  
  
  
endmodule