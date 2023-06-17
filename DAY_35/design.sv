`timescale 10ns/10ps

module siso(input clk,clear,si,
            output reg so
           );


reg [3:0] temp;

always @(posedge clk)
  begin
    if (clear)
      temp <= 0;
    else
      temp <= temp << 1;
      temp[0] <= si;
    
      so = temp[3];
   end

endmodule
