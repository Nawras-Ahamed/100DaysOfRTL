`timescale 10ns/1ps

module CLA(input [3:0]A, B, 
                           input Cin,
                           output [3:0] S,
                           output Cout
						   );
  
  wire [3:0] Ci;
  
  //CARRY COMPUTATION --> Ci
  //  Cj+1 = Gj+(Pj·Cj) ---------> Aj·Bj + (Aj + Bj)·Cj
  //     where carry generate is A.B
  //     and carry propagate is A+B 
  
  
  assign Ci[0] = Cin;
  
  assign Ci[1] = (A[0] & B[0]) | ((A[0]^B[0]) & Ci[0]);
  
  assign Ci[2] = (A[1] & B[1]) | ((A[1]^B[1]) & Ci[1]); 

  assign Ci[3] = (A[2] & B[2]) | ((A[2]^B[2]) & Ci[2]); 
 
  assign Cout  = (A[3] & B[3]) | ((A[3]^B[3]) & Ci[3]); 
 

  assign S = A^B^Ci;
endmodule