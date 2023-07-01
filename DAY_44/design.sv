module FSM1 (
              input clk, reset,
              output reg [3:0] STATE,
              output reg out1, out2
				);
  
  
  localparam [3:0] STATE0 = 4'b0001,STATE1 = 

4'b0010,STATE2 = 4'b0100,STATE3 = 4'b1000;
//ONEHOT-ENCODING 
  
  
always @(posedge clk,posedge reset) 
   begin
	  if (reset) 
        begin
          STATE <= STATE0;
          out1 <= 1'b0;
          out2 <= 1'b0;
	    end 
      else 
          begin
            case(STATE)
              STATE0: 
              begin
                out1 <= 1'b0;
                out2 <= 1'b0;
                STATE <= STATE1;
              end
              STATE1: 
              begin
                out1 <= 1'b1;
                out2 <= 1'b0;
                STATE <= STATE2;
              end
              STATE2: 
              begin
                out1 <= 1'b0;
                out2 <= 1'b1;
                STATE <= STATE3;
              end
              STATE3: 
              begin
                out1 <= 1'b1;
                out2 <= 1'b1;
                STATE <= STATE0;
              end
            	default: STATE <= STATE0;
	    endcase
	  end
	end
  
endmodule