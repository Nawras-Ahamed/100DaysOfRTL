module synchronous_fifo #(parameter FIFO_DEPTH = 8, FIFO_WIDTH = 8) 
                          (input clk, RST,
                          input w_en, r_en,
                          input [FIFO_WIDTH-1:0] data_in,
                          output reg [FIFO_WIDTH-1:0] data_out,
                          output full, empty
                          );
 
//Depth: The number of slots in FIFO
//Width: The number of bits that can be stored
  
  
  parameter PTR_WIDTH = $clog2(FIFO_DEPTH);//RETURNS A CEIL VALUR OF LOG TO BASE 2, AS DEPTH = 2^WIDTH 
  //For example if a FIFO has depth of 256 then to span it completely 8-bits will be needed
  
  reg [PTR_WIDTH:0] w_ptr, r_ptr; //to detect full/empty fifo 
  
  reg [FIFO_WIDTH-1:0] fifo[0:FIFO_DEPTH-1];//internal 
  reg wrap_around;

//FIFO RESET
always@(posedge clk) 
  begin
    if(!RST) 
      begin
        {w_ptr,r_ptr,data_out} <= 0 ;
    end
  end
  
//FIFO WIRTE
always@(posedge clk) 
  begin
    if(w_en & !full)
      begin
        fifo[w_ptr[PTR_WIDTH-1:0]] <= data_in; 
        //The value stored in the w_ptr will point the fifo next adress where the data to be now pushed ,eg . PTR_WIDTH = 3 and fifo[w_ptr[2:0]]---> fifo[value of w_ptr currently] say 6 then it evaluates to fifo[6] and data_in pushes to fio[6] 
      	w_ptr <= w_ptr + 1;
    end
  end

//FIFO READ
always@(posedge clk) 
  begin
    if(r_en & !empty) 
      begin
      data_out <= fifo[r_ptr[PTR_WIDTH-1:0]];
      r_ptr <= r_ptr + 1;
    end
  end
  
//SET FLAGS
  
//a circular buffer implementation SO IT GETS WRAPPED AROUND 
  
// To check MSB of write and read pointers 
  
//The wrap_around signal becomes 1 when the write pointer w_ptr wraps around to the beginning of the buffer 
//(MSB of w_ptr changes from 0 to 1) and the read pointer r_ptr is still at some initial position
  
assign wrap_around = w_ptr[PTR_WIDTH] ^ r_ptr[PTR_WIDTH]; 
  
//Full condition: MSB of write and read pointers are different and remainimg bits are same.
  
assign full = wrap_around & (w_ptr[PTR_WIDTH-1:0] == r_ptr[PTR_WIDTH-1:0]);
  
//Empty condition: All bits of write and read pointers are same.
  
assign empty = !wrap_around & (w_ptr[PTR_WIDTH-1:0] == r_ptr[PTR_WIDTH-1:0]);
 


endmodule
