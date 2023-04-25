module full_adder(
  input a, b, cin,
  output sum, cout);
  
  assign {sum,cout} = { a^b^cin , ((a & b) | (b & cin) | (a & cin))};
  
endmodule


module ripple_carry_adder #(parameter SIZE = 4) (input [SIZE-1:0] A, B, 
  input Cin,
  output [SIZE-1:0] S, Cout);
  
  full_adder FA(A[0], B[0], Cin, S[0], Cout[0]);
  
  genvar i;
  
  	generate 
      for(i= 1;i< SIZE; i++) 
begin
        full_adder FA_i(A[i], B[i], Cout[i-1], S[i], Cout[i]);
end
  	endgenerate
  
endmodule