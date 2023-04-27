`timescale 1ns/1ps

module RCA(
    input [3:0] a,b,
    input cin,
    output [3:0] s,
    output cout
    );
  

  wire [2:0] c; //interconnects
  
  
  FA adder1(a[0],b[0],cin,s[0],c[0]);
  FA adder2(a[1],b[1],c[0],s[1],c[1]);
  FA adder3(a[2],b[2],c[1],s[2],c[2]);
  FA adder4(a[3],b[3],c[2],s[3],cout);
endmodule

module FA(input a,b,c,
          output s,cout);
  
  assign s=a^b^c;
  assign cout= (a&b)|(b&c)|(c&a);
  
endmodule
 