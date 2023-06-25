module randomnumbergen_tb;

 
 reg clock;
 reg reset;
  wire [9:0] rnd_out;

 randomnumbergen DUT (
                       .clock(clock), 
                       .reset(reset), 
                       .rnd_out(rnd_out)
 					 );
 always #50 clock = ~clock;
 initial
   begin
      clock = 0;
      #100 reset = 1;
      #200 reset = 0;
      #10000 $finish;
 	end
 
 initial 
   begin
 	$display("clock rnd");
     $monitor("%b,%b", clock, rnd_out);
   	$dumpfile("dump.vcd");
   	$dumpvars;
   end   
  
endmodule