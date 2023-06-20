module SIPO_BEH( input clk,clr,data_in,
                output reg [3:0] data_out
               );
  
reg [3:0] temp;
  
  always@(posedge clk)
    begin
      if(clr)
        temp <=0;
      else
        begin
          temp[3] <= data_in;
          temp[2] <= temp[3];
          temp[1] <= temp[2];
          temp[0] <= temp[1];
        end
      assign data_out = temp;
      
    end
endmodule
    
          