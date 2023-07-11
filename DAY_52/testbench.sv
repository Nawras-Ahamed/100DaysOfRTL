module single_port_ram_tb;
  
  parameter ADDR_WIDTH = 6;
  parameter DATA_WIDTH = 16;
  parameter DEPTH = 64;
  
  
  reg clk,CS,OE,WE;
  reg [ADDR_WIDTH-1:0] addr;
  wire[DATA_WIDTH-1:0] data;
  reg [DATA_WIDTH-1:0] tb_data;

  single_port_ram DUT (clk,CS,WE,OE,addr,data);


  always #10 clk = ~clk;
  
  assign data = OE ? 'hz :tb_data ;
  
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  
  initial 
    begin
    {clk, CS, WE, addr, tb_data, OE} <= 0;

    repeat (2) @ (posedge clk);
      
	//WRITE OPERATION
    for (integer i = 0; i < 2**ADDR_WIDTH; i= i+1)
      begin
        repeat (1) @(posedge clk) 
          addr <= i;
          WE <= 1; 
          CS <=1; 
          OE <= 0; 
          tb_data <= $random;
      end

    //READ OPERAION
    for (integer i = 0; i < 2**ADDR_WIDTH; i= i+1)
      begin
        repeat (1) @(posedge clk) 
          addr <= i; 
          WE <= 0; 
          CS <= 1; 
          OE <= 1;
      end

    #20 $finish;
     
  end
  
endmodule