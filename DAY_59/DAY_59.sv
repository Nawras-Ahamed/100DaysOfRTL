`timescale 1ns / 1ps

module RR_arbiter(
                            input clk,RST,
                            input [3:0] REQ,
                            output reg [3:0] GRANT
                         );
    

        reg[2:0] PRESENT_STATE;
        reg[2:0] NEXT_STATE;
    
    parameter [2:0]     S0 = 3'b000;
    parameter [2:0]     S1 = 3'b001;
    parameter [2:0]     S2 = 3'b010;
    parameter [2:0]     S3 = 3'b011;
    parameter [2:0]     S4 = 3'b100;
    
    always @(posedge clk or negedge RST)
    begin
         if(!RST)
         PRESENT_STATE <= S0;
         else 
         PRESENT_STATE <= NEXT_STATE;
    end
      
    always @(*)
    begin   
          case(PRESENT_STATE) 
            S0:
                     begin 
                         if(REQ[0])
                             NEXT_STATE = S1;
                         else if (REQ[1])
                              NEXT_STATE = S2;
                         else if (REQ[2])
                            NEXT_STATE = S3;
                         else if (REQ[3])
                            NEXT_STATE = S4;
                          else 
                             NEXT_STATE =S0;
                     end 
               S1: 
                     begin   
                         if (REQ[1])
                            NEXT_STATE = S2;
                         else if (REQ[2])
                            NEXT_STATE = S3;
                         else if (REQ[3])
                              NEXT_STATE = S4;
                         else if(REQ[0])
                             NEXT_STATE =S1;
                         else 
                             NEXT_STATE =S0;
                     end 
            
               S2: 
                     begin   
                          if (REQ[2])
                            NEXT_STATE = S3;
                         else if (REQ[3])
                              NEXT_STATE = S4;
                         else if(REQ[0])
                             NEXT_STATE =S1;
                           else if (REQ[1])
                            NEXT_STATE = S2;
                            else 
                             NEXT_STATE =S0;
                     end 
               S3: 
                     begin   
                        if (REQ[3])
                              NEXT_STATE = S4;
                         else if(REQ[0])
                             NEXT_STATE =S1;
                           else if (REQ[1])
                            NEXT_STATE = S2;
                            else if (REQ[2])
                            NEXT_STATE = S3;
                            else 
                             NEXT_STATE =S0;
                     end 
                 S4: 
                     begin   
                            if(REQ[0])
                             NEXT_STATE =S1;
                           else if (REQ[1])
                            NEXT_STATE = S2;
                            else if (REQ[2])
                            NEXT_STATE = S3;
                            else if (REQ[3])
                              NEXT_STATE = S4;
                            else 
                             NEXT_STATE =S0;
                     end 
                    default: 
                     begin 
                         if(REQ[0])
                             NEXT_STATE = S1;
                         else if (REQ[1])
                              NEXT_STATE = S2;
                         else if (REQ[2])
                            NEXT_STATE = S3;
                         else if (REQ[3])
                            NEXT_STATE = S4;
                          else 
                             NEXT_STATE =S0;
                    end
       endcase         
         
    end         
          
    always @(*)
     begin
        case (PRESENT_STATE)
            S1: GRANT=4'b0001;
            S2: GRANT=4'b0010;
            S3: GRANT=4'b0011;
            S4: GRANT=4'b0100;
            default: GRANT=4'b0000;
        endcase
     end
    
endmodule 