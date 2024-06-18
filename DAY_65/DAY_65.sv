module Shifter(
			input [24:0] significand_i,
			input [7:0] exp_i,
			output reg [24:0] significand_o,
			output [7:0] exp_o
			);

reg [4:0] shift;


always @(significand_i)
begin
    casex (significand_i)
        25'b1_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx : begin   // 24'h800000
            significand_o = significand_i;
            shift = 5'd0;
        end
        25'b1_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : begin   // 24'h400000
            significand_o = significand_i << 1;
            shift = 5'd1;
        end
        25'b1_001x_xxxx_xxxx_xxxx_xxxx_xxxx : begin   // 24'h200000
            significand_o = significand_i << 2;
            shift = 5'd2;
        end
        25'b1_0001_xxxx_xxxx_xxxx_xxxx_xxxx : begin   // 24'h100000
            significand_o = significand_i << 3;
            shift = 5'd3;
        end
        25'b1_0000_1xxx_xxxx_xxxx_xxxx_xxxx : begin   // 24'h080000
            significand_o = significand_i << 4;
            shift = 5'd4;
        end
        25'b1_0000_01xx_xxxx_xxxx_xxxx_xxxx : begin   // 24'h040000
            significand_o = significand_i << 5;
            shift = 5'd5;
        end
        25'b1_0000_001x_xxxx_xxxx_xxxx_xxxx : begin   // 24'h020000
            significand_o = significand_i << 6;
            shift = 5'd6;
        end
        25'b1_0000_0001_xxxx_xxxx_xxxx_xxxx : begin   // 24'h010000
            significand_o = significand_i << 7;
            shift = 5'd7;
        end
        25'b1_0000_0000_1xxx_xxxx_xxxx_xxxx : begin   // 24'h008000
            significand_o = significand_i << 8;
            shift = 5'd8;
        end
        25'b1_0000_0000_01xx_xxxx_xxxx_xxxx : begin   // 24'h004000
            significand_o = significand_i << 9;
            shift = 5'd9;
        end
        25'b1_0000_0000_001x_xxxx_xxxx_xxxx : begin   // 24'h002000
            significand_o = significand_i << 10;
            shift = 5'd10;
        end
        25'b1_0000_0000_0001_xxxx_xxxx_xxxx : begin   // 24'h001000
            significand_o = significand_i << 11;
            shift = 5'd11;
        end
        25'b1_0000_0000_0000_1xxx_xxxx_xxxx : begin   // 24'h000800
            significand_o = significand_i << 12;
            shift = 5'd12;
        end
        25'b1_0000_0000_0000_01xx_xxxx_xxxx : begin   // 24'h000400
            significand_o = significand_i << 13;
            shift = 5'd13;
        end
        25'b1_0000_0000_0000_001x_xxxx_xxxx : begin   // 24'h000200
            significand_o = significand_i << 14;
            shift = 5'd14;
        end
        25'b1_0000_0000_0000_0001_xxxx_xxxx : begin   // 24'h000100
            significand_o = significand_i << 15;
            shift = 5'd15;
        end
        25'b1_0000_0000_0000_0000_1xxx_xxxx : begin   // 24'h000080
            significand_o = significand_i << 16;
            shift = 5'd16;
        end
        25'b1_0000_0000_0000_0000_01xx_xxxx : begin   // 24'h000040
            significand_o = significand_i << 17;
            shift = 5'd17;
        end
        25'b1_0000_0000_0000_0000_001x_xxxx : begin   // 24'h000020
            significand_o = significand_i << 18;
            shift = 5'd18;
        end
        25'b1_0000_0000_0000_0000_0001_xxxx : begin   // 24'h000010
            significand_o = significand_i << 19;
            shift = 5'd19;
        end
        25'b1_0000_0000_0000_0000_0000_1xxx : begin   // 24'h000008
            significand_o = significand_i << 20;
            shift = 5'd20;
        end
        25'b1_0000_0000_0000_0000_0000_01xx : begin   // 24'h000004
            significand_o = significand_i << 21;
            shift = 5'd21;
        end
        25'b1_0000_0000_0000_0000_0000_001x : begin   // 24'h000002
            significand_o = significand_i << 22;
            shift = 5'd22;
        end
        25'b1_0000_0000_0000_0000_0000_0001 : begin   // 24'h000001
            significand_o = significand_i << 23;
            shift = 5'd23;
        end
        25'b1_0000_0000_0000_0000_0000_0000 : begin   // 24'h000000
            significand_o = significand_i << 24;
            shift = 5'd24;
        end
        default : begin //temp two's complement with no shift
            significand_o = (~significand_i) + 1'b1;
            shift = 8'd0; 
        end
    endcase
end

assign exp_o = exp_i - shift;


endmodule


module IEEE_754_ADD_SUB(input [31:0] A_in,B_in,
							input add_sub_select, //1 add , 0 sub
							output exception, //set if exponents are 255 both
							output [31:0] result_o 
							);

//INTERNAL SIGNALS

wire operation_add_sub_select_internalwire;
wire enable;
wire output_sign;

wire [31:0] op_a,op_b;
wire [23:0] significand_i_a,significand_i_b;
wire [7:0] exp_diff;


wire [23:0] shifted_significand_b;
wire [7:0] adjusted_exponent_b;

wire [24:0] computed_significand;
wire [30:0] sum_result_temp;

wire [23:0] complemented_significand_b;
wire [24:0] adjusted_significand_b;
wire [30:0] difference_result_temp;

wire [24:0] sub_shifted_result; 

wire [7:0] exp_o;



assign {enable,op_a,op_b} = (A_in[30:0] < B_in[30:0]) ? {1'b1,B_in,A_in} : {1'b0,A_in,B_in}; // For operations always op_a must not be less than B_in

assign exp_i = op_a[30:23];
assign exp_b = op_b[30:23];

assign exception = (&op_a[30:23]) | (&op_b[30:23]);	// Exception flag sets 1 if either one of the exponent is 255. self and will result in a single bit and or'ing of the bits will give the necessary result

assign output_sign = add_sub_select ? (enable ? (!op_a[31] : op_a[31]) ) : op_a[31] ;

assign operation_add_sub_select_internalwire = add_sub_select ? op_a[31] ^ op_b[31] : ~(op_a[31] ^ op_b[31]); // SIGN BIT EXTRACTION

assign significand_i_a = (|op_a[30:23]) ? {1'b1,op_a[22:0]} : {1'b0,op_a[22:0]}; // If exponent is zero SIGN bit = 0,else 1
assign significand_i_b = (|op_b[30:23]) ? {1'b1,op_b[22:0]} : {1'b0,op_b[22:0]}; // If exponent is zero SIGN bit = 0,else 1

assign exp_diff = op_a[30:23] - op_b[30:23]; // Exponent difference calculation

assign shifted_significand_b = significand_i_b >> exp_diff;

assign adjusted_exponent_b = op_b[30:23] + exp_diff; 

assign temp = (op_a[30:23] == adjusted_exponent_b);										// Checking if exponents are same


// if (add_sub_select == 1'b1) begin
//         if (temp & operation_add_sub_select_internalwire) begin
//             computed_significand = significand_i_a + shifted_significand_b;
//         end else begin
//             computed_significand = 25'd0;
//         end

//         // Sum result extraction
//         if (computed_significand[24]) begin
//             sum_result_temp[22:0] = computed_significand[23:1];
//             sum_result_temp[30:23] = 1'b1 + op_a[30:23];
//         end else begin
//             sum_result_temp[22:0] = computed_significand[22:0];
//             sum_result_temp[30:23] = op_a[30:23];
//         end
//     end else begin
//         // Subtraction block using if-else
//         if (temp & !operation_add_sub_select_internalwire) begin
//             complemented_significand_b = ~(shifted_significand_b) + 24'd1;
//             adjusted_significand_b = significand_i_a + complemented_significand_b;
//         end else begin
//             adjusted_significand_b = 25'd0;
//         end

//         // Call to Shifter module (assuming it handles the subtraction)
//         Shifter pe(adjusted_significand_b, op_a[30:23], sub_shifted_result, exp_o);

//         difference_result_temp[30:23] = exp_o;
//         difference_result_temp[22:0] = sub_shifted_result[22:0];
//     end

//     // Output assignment using if-else
//     if (exception) begin
//         result_o = 32'b0;
//     end else begin
//         if (!operation_add_sub_select_internalwire) begin
//             result_o = {output_sign, difference_result_temp};
//         end else begin
//             result_o = {output_sign, sum_result_temp};
//         end
//     end

// endmodule

//ADDITION
assign computed_significand = (temp & operation_add_sub_select_internalwire) ? (significand_i_a + shifted_significand_b) : 25'd0; 

assign sum_result_temp[22:0] = computed_significand[24] ? computed_significand[23:1] : computed_significand[22:0];	

assign sum_result_temp[30:23] = computed_significand[24] ? (1'b1 + op_a[30:23]) : op_a[30:23];	





//SUBTRACTION

assign complemented_significand_b = (temp & !operation_add_sub_select_internalwire) ? ~(shifted_significand_b) + 24'd1 : 24'd0 ; 

assign adjusted_significand_b = temp ? (significand_i_a + complemented_significand_b) : 25'd0;


Shifter pe(adjusted_significand_b,op_a[30:23],sub_shifted_result,exp_o);


assign difference_result_temp[30:23] = exp_o;

assign difference_result_temp[22:0] = sub_shifted_result[22:0];

assign result_o = exception ? 32'b0 : ((!operation_add_sub_select_internalwire) ? {output_sign,difference_result_temp} : {output_sign,sum_result_temp});

endmodule