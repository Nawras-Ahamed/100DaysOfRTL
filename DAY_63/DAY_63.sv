`timescale 1ns / 1ps

module carry_skip_16bit(input [15:0]a, 
						input [15:0]b, 
						input cin,
						output reg [15:0]sum, 
						output reg cout);


						wire [2:0] c; //internal connections

carry_skip_4bit_adder csa1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c[0]));
carry_skip_4bit_adder csa2 (.a(a[7:4]), .b(b[7:4]), .cin(c[0]), .sum(sum[7:4]), .cout(c[1]));
carry_skip_4bit_adder csa3 (.a(a[11:8]), .b(b[11:8]), .cin(c[1]), .sum(sum[11:8]), .cout(c[2]));
carry_skip_4bit_adder csa4 (.a(a[15:12]), .b(b[15:12]), .cin(c[2]), .sum(sum[15:12]), .cout(cout));

endmodule


module carry_skip_4bit_adder(input [3:0] a,b,
							 input cin, 
							 output reg [3:0]sum, 
							 output cout);

wire [3:0] p;
wire c0;
wire bp;

ripple_carry_4_bit rca1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c0));


generate_p p1(a,b,p,bp);

mux2X1 m0(.in0(c0),.in1(cin),.sel(bp),.out(cout));

endmodule

module generate_p(input [3:0] a,b,
				  output reg [3:0] p,
				  output reg bp);

assign p  = a^b;    //get all propagate bits
assign bp = &p;   // and p0p1p2p3 bits
endmodule


module ripple_carry_4_bit(input [3:0] a,b,
						  input cin, 
						  output [3:0] sum, 
						  output cout);

wire c1,c2,c3;

full_adder fa0(.a(a[0]), .b(b[0]),.cin(cin), .sum(sum[0]),.cout(c1));
full_adder fa1(.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]),.cout(c2));
full_adder fa2(.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]),.cout(c3));
full_adder fa3(.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]),.cout(cout));
endmodule


module full_adder(input a,b,cin,
				  output reg sum, cout);

wire x,y,z;
assign sum = a^b^cin;
assign cout = a&b + b&cin + cin&a;
endmodule


module mux2X1(input in0,in1,
			  input sel,
			  output out);

assign out=sel?in1:in0;

endmodule