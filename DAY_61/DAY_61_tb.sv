module PWM_TB;

 wire dout;
 reg clk,rst;

pwm_gen #(.period(5)) DUT(.clk(clk),
  .rst(rst),
  .dout(dout)
  );

 

initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      clk=0;
    end

    initial 
    begin
      forever
      #5 clk=~clk;
    end

    initial
    begin
    	rst = 0;
    	#2 rst = 1;
    	#2 rst = 0;
      #5000 $finish;
    end
    
endmodule