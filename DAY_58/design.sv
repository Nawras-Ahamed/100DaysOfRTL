module FPA(
	input            CLK,
	input            RST,
    input [3:0]      REQ,
     output reg [3:0] GNT
          );
  //REQ[3] > REG[2] > REQ[1] > REQ[0]  PRIORITY ORDER
  
  always@ (posedge CLK or negedge RST)
	begin		
      if(!RST)
				GNT <= 4'b0000;
          else if(REQ[3])
				GNT <= 4'b1000;
          else if(REQ[2])
				GNT <= 4'b0100;
          else if(REQ[1])
				GNT <= 4'b0010;
          else if(REQ[0])
				GNT <= 4'b0001;
          else
				GNT <= 4'b0000;
	end
endmodule