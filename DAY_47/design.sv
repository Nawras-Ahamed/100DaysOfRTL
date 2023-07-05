module seq_non_overlap(input clk, reset, data_stream,
                       output mealy_output);
  
  
//1010 non overlapping sequence detector 
  
localparam A=1,B=2,C=3,D=4;  
reg [3:0] present_state, next_state;
  
  
  //dff block
  
  always @(posedge clk) 
    begin
    if(!reset) 
      present_state <= A;
    else 
      present_state <= next_state;
    end
  
  
  //combinational block
  
  always @(present_state or data_stream) 
    begin
      case(present_state)
        A: begin
             if(data_stream == 0) 
               next_state = A;
             else       
               next_state = B;
           end
        
        B: begin
             if(data_stream == 0) 
               next_state = C;
             else       
               next_state = B;
           end
        
        C: begin
             if(data_stream == 0) 
               next_state = A;
             else       
               next_state = D;
           end
        
        D: begin
          if(data_stream == 0) 
            next_state = A; 
             else       
               next_state = B;
           end
        
        default: next_state = A;
      endcase
  	end
  
  assign mealy_output = (present_state == D)? 1:0;
  
endmodule