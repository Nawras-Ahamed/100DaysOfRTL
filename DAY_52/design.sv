module single_port_ram #(parameter ADDR_WIDTH = 6,parameter DATA_WIDTH = 16,parameter DEPTH = 64)
                        ( input clk,CS,WE,OE,
                       input [ADDR_WIDTH-1:0]	addr,
                       logic [DATA_WIDTH-1:0]	data );

reg [DATA_WIDTH-1:0] 	tmp_data;
reg [DATA_WIDTH-1:0] 	RAM [DEPTH:0];

always @ (posedge clk) 
   begin
     if (WE & CS)
         RAM[addr] <= data;
     if(!WE & CS )
         tmp_data <= RAM[addr];    
   end 

assign data = (CS & OE) & !WE ? tmp_data : 'hz;
  
endmodule