`timescale 10ns/1ps

module SR_FF(input clk,
             input S,R,
             input RST,
             output reg Q,
             output Qbar);
  

always@(posedge clk or negedge RST) //asynchronous reset
begin        
   if(!RST) 
      Q<= 0;
    	else 
          begin
            case({S,R})
              2'b00: Q<= Q;
              2'b01: Q<= 1'b0;
              2'b10: Q<= 1'b1;
              2'b11: Q<= 1'bx;
            endcase
          end
end
  
assign Qbar = ~Q;

endmodule
      