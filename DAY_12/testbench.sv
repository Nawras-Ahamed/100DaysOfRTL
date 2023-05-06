`timescale 10ns/1ps

module decoder3_8_tb;

	reg [2:0] d;
	wire [7:0] y;

	
	decoder_3X8 DUT (.d(d), 
					 .y(y)
	                );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end

	initial 
      begin
        d=3'b000;			#100;
        d=3'b001;			#100;
        d=3'b010;			#100;
        d=3'b011;			#100;
        d=3'b100;			#100;
        d=3'b101;			#100;
        d=3'b110;			#100;
        d=3'b111;			#100;
     $finish;

	end
      
endmodule

