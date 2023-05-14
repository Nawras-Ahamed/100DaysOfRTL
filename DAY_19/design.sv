`timescale 10ns/1ps

module ALU(input [7:0] A,B,
           input [3:0] opcode,
           output reg carry_flag=1'b0,
 		   output reg z_flag=1'b0,
 		   output reg [8:0] out);
 
  always @(opcode,A,B)
    begin
      case(opcode)
        
         4'b0000:
           begin
             out = A + B ;
             carry_flag  = out[8];
             z_flag  = (out == 1'b0);
           end
        
         4'b0001:
           begin
             out = A - B ;

             carry_flag  = out[8];
             z_flag  = (out == 1'b0);
             
           end
        
         4'b0010:
           begin
           	  out = A * B;
              z_flag  = (out == 1'b0);
           end  
         4'b0011: 
           begin
             if(B) begin
               out = A/B;
              z_flag  = (out == 1'b0);
             end
           end
         4'b0100: // Logical shift left
           out = A<<1;
         4'b0101: // Logical shift right
           out = A>>1;
         4'b0110: // Rotate left
           out = {A[6:0],A[7]};
         4'b0111: // Rotate right
           out = {A[0],A[7:1]};
          4'b1000: 
           out = A & B;
          4'b1001: 
           out = A | B;
          4'b1010:
           out = A ^ B;
          4'b1011: 
           out = ~(A | B);
          4'b1100: 
           out = ~(A & B);
          4'b1101: 
           out = ~(A ^ B);
          4'b1110: // Greater than
           out = (A>B)?8'd1:8'd0 ;
          4'b1111: // Equal to
            out = (A==B)?8'd1:8'd0 ;
  	 default:  
       begin
       out = 16'b0;
	   carry_flag  = 1'b0;
	   z_flag = 1'b0; 
       end  
     endcase
    end  
endmodule
       
  