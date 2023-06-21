module barrel_shifter_tb;
  
  reg [7:0] data_in;
  reg clear,lr;
  reg [2:0] n;
  wire [7:0] data_out;
  
  
  
  barrel_shifter DUT(data_in,clear,lr,n,data_out);
  
  
  initial begin
    clear =1;
    #5 clear =0;
    #5;
    
    data_in=8'b10111110;
    lr =1;
    n = 3'h5;
    
    #10;
    data_in=8'd32;
    lr =1;
    n = 3'h2;
    
    #10;
    data_in=8'd255;
    lr =0;
    n = 3'h7;
    
    #20 $finish;
    
  end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
endmodule

     