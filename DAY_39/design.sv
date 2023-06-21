module UNI_SR(input clk,clear,
              input [3:0]data_in,
              input shift_data,
              input [1:0]mode,
              output reg [3:0] data_out,
              output leftshift_o,rightshift_o
             );
  
  
//data_in AND data_out are parallel data 
//shift_data is a 1bit data to be shifted by one bit to the left or right 
  
  always@(posedge clk)
    begin
      if(clear)
        data_out <= 0;
      else
        begin
          case(mode)
            
            2'b01 : data_out <= {shift_data,data_out[3:1]}; //right shift
            2'b10 : data_out <= {data_out[2:0],shift_data};  //left shift
            2'b11 : data_out <= data_in;
            default: data_out <= data_out;
        
          endcase  
        end
     end
  assign leftshift_o = data_out[0];
  assign rightshift_o = data_out[3];
      
      
endmodule
      
      