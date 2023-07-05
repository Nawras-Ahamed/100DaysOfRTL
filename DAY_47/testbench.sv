module seq_non_overlap_tb;
  
  
reg clk,reset,data_stream;
wire mealy_output;
  
seq_non_overlap DUT(clk,reset,data_stream,mealy_output);
  
initial 
  begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  always #5 clk= ~clk;
  
  initial
    begin
      clk=0;
      reset=1;
      data_stream=0;
      #10;
      #20 reset = 0;
      #5 reset  = 1;
       #10 data_stream = 0;
      #10 data_stream = 1;
      #10 data_stream = 0;
      #10 data_stream = 1;
      #10 data_stream = 0;
      #10 data_stream = 1;
      #10 data_stream = 0;
      #10 data_stream = 1;
      #10 data_stream = 1;
      #10 data_stream = 1;
      #10 data_stream = 0;
      #50 $finish;
  end
endmodule