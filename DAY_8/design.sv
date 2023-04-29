`timescale 1ns/1ps

module BCD_ADDER(a,b,c_in,sum,carry); //behaviroal modellling
    input [3:0] a,b;
    input c_in;
  
    output [3:0] sum;
    output carry;
    
  reg [4:0] sum_temp; //5-bit temp storing of sum before +6 correction
  reg [3:0] sum;  //final sum variable
    reg carry;  

    always @(a,b,c_in)
      begin
          sum_temp = a+b+c_in; 
          if(sum_temp > 9)    begin
              sum_temp = sum_temp+6; //addition of 6 if the result is > than 9
              carry = 1;  //Correction bit setting
              sum = sum_temp[3:0]; 
      end
        else   
          begin
            carry = 0;
            sum = sum_temp[3:0];
        end
    end     
endmodule
