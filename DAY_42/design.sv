module randomnumbergen (
              			input clock,
              			input reset,
  						output wire [9:0] rnd_out 
    					);



reg [9:0] random, random_next,random_end;
reg [3:0] count, count_next;
  
// wire feedback = random[9] ^ random[8]; //MAXIMAL LENGTH LFSR  (2^10)-1
  
  wire feedback = random[9] ^ random[6]; //as per xilinx documentation 

always @ (posedge clock)
    begin
       if (reset)
           begin
              random <= 13'hF; 
              count <= 0;
           end
       else
         begin
            random <= random_next;
            count <= count_next;
         end
    end

always @ (*)  //combinational block
    begin
      random_next = random; 
      count_next = count;
      
      
      random_next = {random[8:0], feedback}; //shift left 
      count_next = count + 1;
      

      if (count == 10)
        begin
          count = 0;
          random_end = random; //assign the random number to output after 10 shifts

        end

    end

assign rnd_out = random_end;

endmodule