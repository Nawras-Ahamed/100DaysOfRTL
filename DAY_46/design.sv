module RISING_edge_FSM
(
    input wire clk, reset, 
    input wire level, 
    output reg Moore_output
);

    
  localparam [1:0] zeroMoore = 2'b00, edgeMoore = 2'b01, oneMoore = 2'b10; 

reg[1:0] Moore_Present, Moore_next;

always @(posedge clk, posedge reset)
    begin
      if(!reset) 
           Moore_Present <= zeroMoore;       
        else 
            Moore_Present <= Moore_next;
    end
  

always @(Moore_Present, level)
  begin
    
    Moore_next = Moore_Present;
    
    Moore_output = 1'b0;
    case(Moore_Present)
      zeroMoore: 
        if(level) 
          Moore_next = edgeMoore; 
      edgeMoore:
        begin
          Moore_output = 1'b1; 
          if(level) 
            Moore_next = oneMoore; 
          else    
            Moore_next = zeroMoore; 
        end
      oneMoore:if(~level) 
         		Moore_next = zeroMoore;
      
      default : Moore_output = 1'b0;
    endcase
  end
endmodule