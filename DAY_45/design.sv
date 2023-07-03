module RISING_edge_FSM(
                            input wire clk, reset, 
                            input wire level, 
                            output reg MEALY_OUTPUT
                            );

localparam  S0 = 1'b0, S1 =  1'b1; // ONLY 2 states are required for Mealy FSM

reg Mealy_Present, Mealy_next; 

// MODELLING OF D FF OR THE SEQUENTIAL BLOCK
  
always @(posedge clk, posedge reset)
begin
    if(reset) 
        Mealy_Present <= S0;
    else 
        Mealy_Present <= Mealy_next;
end

//MODELLING THE STATES OR THE COMBINATIONAL BLOCK
  
always @(Mealy_Present, level)		//HERE LEVEL IS THE I/P (INSTEAD OF A CLOCK FOR EDGEDETECTION)
	begin
      // store present state as next
      Mealy_next = Mealy_Present; 
      MEALY_OUTPUT = 1'b0;
      // set tick to zero (so that 'tick = 1' is available for 1 cycle only)
      case(Mealy_Present)
          S0: if(level)  
            begin 
              // if level is 1, then go to state one,
              Mealy_next = S1; 
              // otherwise remain in same state.
              MEALY_OUTPUT = 1'b1;
            end
          S1: 
            if(!level) 
                // if level is 0, then go to zero state,
                  Mealy_next = S0; 
        // otherwise remain in one state.
        default :  MEALY_OUTPUT = 1'b0; 
     endcase
end
endmodule