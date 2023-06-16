`timescale 10ns/1ps

module gray_counter_tb;
  
parameter N=8;
  
reg clk,reset;
wire [N-1:0] out;

  gray_counter  DUT(.clk(clk),
                  		.reset(reset),
                  		.out(out));
  
always #5 clk = ~clk;

initial 
  begin
    {clk, reset} <= 0;
    #20 reset <= 1;
      #250 $finish;
  end
  
initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule