`timescale 10ns/10ps

module sisotb;

reg clear,si,clk;
wire so;

siso DUT (.clk(clk), 
          .clear(clear),
          .si(si),
          .so(so)
         );

  
always #5 clk = ~clk;
  
initial 
	begin
      clk = 0;
      clear = 0;
      si = 0;

      #10 clear= 1;
      #10 clear= 0;

      #10 si=1;
      #10 si=0;
      #10 si=1'bx;
      #10 si=0;
      #10 si=1;
      #10 si=0;

      #100 $finish;
      
	end
  
initial 
	begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
 
endmodule