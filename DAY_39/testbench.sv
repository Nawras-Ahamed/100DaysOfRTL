module UNI_SR_TB;
  
  reg clk,clear,shift_data;
  reg [1:0] mode;
  reg [3:0] data_in;
  wire [3:0] data_out;
  wire leftshift_o,rightshift_o;
  
  UNI_SR  DUT(clk,clear,
              data_in,shift_data,
              mode,
              data_out,
              leftshift_o,rightshift_o);
  
  always #5 clk = ~clk;
  
  initial 
    begin
    clk=0;
    clear = 1;
    #5 clear =0;
    
    data_in = 4'b1010;
    shift_data = 1'b0;
    
    mode = 2'h3; 
    #5;
    mode = 2'h1; 
    #20;
      
  
    data_in = 4'b1101;
    shift_data = 1'b1;
    mode = 2'h3;
    #10;
    mode = 2'h2; 
    #20;
    mode = 2'h0;
    #10;

   data_in = 4'b0110;
   shift_data = 1'b1;
    mode = 2'h2; 
    #5;
    mode = 2'h1; 
    #20;

    $finish;
  end

  initial
    begin 
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
   
endmodule