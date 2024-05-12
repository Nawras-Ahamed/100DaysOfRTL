`timescale 1ns / 1ps

module pwm_gen #(parameter period=10)(
    input clk, rst, 
    output reg dout
    );

integer count;
integer ton;
reg next;
 
always@(posedge clk)
begin
     if(rst == 1'b1)
        begin
         count <= 0;
         ton   <= 0;
         next  <= 1'b0;
        end   
     else 
       begin
            if(count <= ton) 
              begin
                  count <= count + 1;
                  dout  <= 1'b1;
                  next  <= 1'b0;
              end
            else if (count < period)
              begin
                  count <= count + 1;
                  dout <= 1'b0;
                  next <= 1'b0;
              end
            else
               begin
                   next  <= 1'b1;
                   count <= 0;
               end
       end
end
 
always@(posedge clk)
begin
     if(rst == 1'b0) 
     begin 
         if(next == 1'b1)
            begin
                if(ton < period)
                   ton <= ton + 1;
                else
                   ton <= 0;
            end
     end   
end

endmodule