`timescale 10ns/1ps

module rc_add_sub #(parameter WIDTH = 4) (
  input [WIDTH-1:0] A, B, 
  input CTRL, //FOR SELCTING ADD/SUB FUNCTIONALITY
  output [WIDTH-1:0] S,
  output Cout
			);
  
  
  reg [WIDTH-1:0] final_b; //systemverilog datatype having 2_states
  
 
  assign  final_b[0] = B[0] ^ CTRL; //if ctrl signal is 1 it acts as an inverter else it acts as a buffer 
  
    
  full_adder fa0(A[0], final_b[0], CTRL, S[0], Cout[0]); //control signal is the cin for the first adder
  
 genvar i;
  
  generate 
    
    for(i = 1; i < WIDTH; i++)
      
      begin
        assign final_b[i] = B[i] ^ CTRL;
        
        full_adder fa(A[i], final_b[i], Cout[i-1], S[i], Cout[i]);
        
        //cout[i-1] because we need the carry of prev FA to be the i/p of the next FA's c_in  
    end
    
  endgenerate  
  
endmodule


module full_adder(
  input a, b, cin,
  output sum, cout);
  
 
  assign sum = a^b^cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
  
endmodule

