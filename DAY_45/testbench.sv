module RISING_edge_FSM_TB;
  
reg clk,reset,level;
wire MEALY_OUTPUT;
  

  RISING_edge_FSM DUT(clk,reset,level,MEALY_OUTPUT);
  
  
always #5 clk = ~clk;
  
initial 
  begin 
    $dumpfile("dump.vcd");
    $dumpvars;
    clk=0;
    reset=0;
    #20; 
    reset=1;
    #5;
    #50 level = 1;
    #50 level = 0;
    #20 level = 1;
    #10 level = 0;
    #12 level = 1;
    #11 level = 0;
    #100 $finish;
  end
  
endmodule
