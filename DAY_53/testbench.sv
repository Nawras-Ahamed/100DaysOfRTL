module dual_port_ram_tb;
  
  parameter ADDR_WIDTH = 6;
  parameter DATA_WIDTH = 16;
  parameter DEPTH = 64;
  
  reg [DATA_WIDTH-1:0] data_a,data_b;
  reg clk,we_a,we_b;
  reg [ADDR_WIDTH-1:0] addr_a,addr_b;
  wire[DATA_WIDTH-1:0] q_a,q_b;
 

  dual_port_ram DUT (data_a,data_b,addr_a,addr_b,we_a,we_b,clk,q_a,q_b);


  always #10 clk = ~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  
  initial 
    begin
      {clk,we_a,we_b,addr_a,addr_b} <= 0;

    repeat (2) @ (posedge clk);
      
	//WRITE OPERATION
      for (integer i = 0; i < 2**(ADDR_WIDTH-1); i= i+1)
      fork
        repeat (1) @(posedge clk) 
          addr_a <= i;
          we_a<= 1;
         data_a <= $random;
      join
      
      for (integer i = 2**(ADDR_WIDTH-1) ; i < 2**(ADDR_WIDTH); i= i+1)
      fork
        repeat (1) @(posedge clk) 
          addr_b <= i;
          we_b<= 1;
         data_b <= $random;
      join

    //READ OPERAION
      for (integer i = $random ; i < 2**ADDR_WIDTH; i= i+1)
      begin
        repeat (1) @(posedge clk) 
          we_b=0;
          addr_b <= i; 
      end
      for (integer i = $random ; i < 2**ADDR_WIDTH; i= i+2)
      begin
        repeat (1) @(posedge clk) 
          we_a=0;
          addr_a <= i; 
      end
    #20 $finish;
     
  end
  
endmodule