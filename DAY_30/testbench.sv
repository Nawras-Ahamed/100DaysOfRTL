`timescale 10ns/1ps
module odd_counter_tb;
  
  reg clk;
  reg reset;
  wire [7:0] out;
  
  ODD_COUNTER DUT(.clk(clk),
                  .reset(reset),
                  .out(out)
                 );
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
always #5 clk = ~clk;
  
  initial begin
    clk <=0;
    reset <=1;
    #5reset <=0;
    #100 $finish;
  end
endmodule

 