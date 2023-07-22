module synchronous_fifo_tb;

parameter FIFO_DEPTH = 8, FIFO_WIDTH = 8;
  
reg clk,RST,w_en,r_en;
reg [FIFO_WIDTH-1:0] data_in;
wire [FIFO_WIDTH-1:0] data_out;
wire full,empty;

synchronous_fifo DUT(clk, RST, w_en, r_en, data_in, data_out, full, empty);
  
always #5 clk = ~clk;
  
initial 
    begin
    {clk,RST,w_en,r_en}<=0; 
      #5 RST = 1;
      drive(20);
      drive(40);
      $finish;
  end
  
initial 
  begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
task drive(int delay);
  {w_en,r_en}<=0;
fork
  begin
      repeat(10)
        @(posedge clk)
        push();
		w_en=0;
    end
	begin
      repeat(10)
        @(posedge clk)
        pop();
		r_en=0;
    end
join
endtask 
  
task push();
    if(!full) 
    	begin
          w_en = 1;
          data_in = $random;
          $display("Pushing: w_en=%b, r_en=%b, data_in=%h",w_en, r_en,data_in);
          $display("Write pointer location = %b",DUT.w_ptr);
    	end
    else 
      	$display("FIFO is Full Can't push data_in=%d", data_in);
endtask 
  
task pop();
  if(!empty) 
    begin
      r_en = 1;
      $display("Popping: w_en=%b, r_en=%b, data_out=%h",w_en, r_en,data_out);
    end
    else 
      $display("FIFO is Empty No data to Pop out");
  endtask
  
endmodule