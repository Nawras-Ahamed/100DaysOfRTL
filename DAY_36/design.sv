`timescale 10ns/1ns

module PISO(input clk,clr,load,
            input [7:0] data_in,
            output reg data_out
           );
  
  
  reg [7:0] data_reg;
  
  
  always@(posedge clk or negedge clr)
    begin
      if(~clr)
        data_reg <= 0;
      
      else
        begin 
          if(load)
          {data_reg,data_out} <= {data_in,1'b0}; //clear the ouput and load the data into temp register
          else 
          {data_reg,data_out} <= {1'b0,data_reg[7:0]};
        end
    end
  
endmodule