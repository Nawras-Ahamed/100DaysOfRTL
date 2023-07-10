module Rom_tb;
    reg clk;
    reg r_en;
    reg [3:0] addr;
    wire [15:0] data;
        
Rom DUT(clk,r_en,addr,data);
  
always #5 clk = ~clk;
  
initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk = 0;
      DUT.mem[0] = 8'b00000000;
      DUT.mem[1] = 8'h1191;
      DUT.mem[2] = 8'hd23;
      DUT.mem[3] = 8'hcae2;
      DUT.mem[4] = 8'h45834;
      DUT.mem[5] = 8'h65324;
      DUT.mem[6] = 8'h856;
      DUT.mem[7] = 8'h745;

      #10 r_en = 1;
      #10 addr = 1;
      #10 addr = 2;
      #10 addr = 3;
      #10 addr = 4;
      #10 addr = 5;
      
      #10 $finish;
    end
endmodule

