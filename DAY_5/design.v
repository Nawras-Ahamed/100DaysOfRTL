`timescale 10ns/1ps


module full_adder(a,b,c,sum,carry);
  
    input a,b,c;
    output sum,carry;
  
    assign sum = a^b^c;
    assign carry = (a & b)|(b & c)|(c & a);
  
 
endmodule

module ripple_carry_adder(a,b,cin,s,carry_out);
  
      input [3:0]a,b;
      input cin;
      output [3:0]s;
      output carry_out;
      wire c1,c2,c3,x0,x1,x2,x3;
  
//       xor(x0,cin,b[0]);
//       xor(x1,cin,b[1]);
//       xor(x2,cin,b[2]);
//       xor(x3,cin,b[3]);
 
  full_adder f1(.a(a[0]),.b(b[0]),.c(cin),.sum(s[0]),.carry(c1));
  full_adder f2(.a(a[1]),.b(b[1]),.c(c1),.sum(s[1]),.carry(c2));
  full_adder f3(.a(a[2]),.b(b[2]),.c(c2),.sum(s[2]),.carry(c3));
  full_adder f4(.a(a[3]),.b(b[3]),.c(c3),.sum(s[3]),.carry(carry_out));
  
  
endmodule
