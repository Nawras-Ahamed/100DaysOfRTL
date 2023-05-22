`timescale 10ns/1ps

module RS_LATCH(input S,R,E,
                output Q,Q_bar);
	
  assign Q = ~(R|Q_bar|E);
  assign Q_bar = ~(S|Q|E);
	
endmodule