module fsm_serial_adder_tb;
  
reg A,B,clk,reset;
wire sum,Cout;
  
  fsm_serial_adder DUT(A,B,clk,reset,sum,Cout);
  
  
always #5 clk = ~clk;
initial 
  begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  
initial 
  begin 
    clk=0;
    reset=1;
    A=0;
    B=0;
    #10;
    reset=0;
    A=1;
    B=0;
    #10;
    A=1;
    B=1;
    #10;
    A=0;
    B=0;
    #10;
    A=1;
    B=1;
    #10;
    A=0;
    B=1;
    #10;
    A=1;
    B=1;
    #10;
    A=0;
    B=1;
    #10;
    $finish;
  end
endmodule