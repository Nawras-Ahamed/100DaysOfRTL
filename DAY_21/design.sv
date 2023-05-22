`timescale 10ns/1ps

module SR_latch(input E,R,S, 
                output Q,Qbar); 
  
  wire R_TEMP, S_TEMP;

  nand(R_TEMP,R,E);
  nand(S_TEMP,S,E);
  nand (Qbar, R_TEMP, Q); 
  nand(Q, S_TEMP, Qbar); 
  
endmodule