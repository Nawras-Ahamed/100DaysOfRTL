`timescale 1ns/1ps
module DUT;
		reg i;
		reg [1:0] s;
		wire [3:0] y;

	DMUX DMUX_DUT(.i(i), 
			      .s(s), 
			      .y(y));
		initial 
          begin
            $dumpfile("waveform.vcd");
      		$dumpvars;
            
            $monitor("sel = %b, i = %b -> y0 = %0b, y1 = %0b ,y2 = %0b, y3 = %0b", s,i, y[0],y[1],y[2],y[3]);
    s=2'b00; i=0; #1;
    s=2'b00; i=1; #1;
    s=2'b01; i=0; #1;
    s=2'b01; i=1; #1;
    s=2'b10; i=0; #1;
    s=2'b10; i=1; #1;
    s=2'b11; i=0; #1;
    s=2'b11; i=1; #1;
          end
endmodule 
