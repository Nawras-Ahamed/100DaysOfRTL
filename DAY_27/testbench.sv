module updowncounter_tb;
  
  reg clk, RST;
  reg j, k;
  reg up;
  wire [3:0] q, qb;
  
  
updown_counter updc(clk, RST, j, k, up, q, qb);
  
  
always #2 clk = ~clk;
  
  initial 
    begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule


  initial 
    begin
      clk = 0; 
      RST = 0; 
      up = 1;
      #5; 
      RST = 1;
      j = 1; 
      k = 1;
      #80;
      RST = 0;
      #5; 
      RST = 1; 
      up = 0;
      #100;
      $finish;
  end

 

  