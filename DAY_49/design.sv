module fsm_serial_adder(  input A,B,clk,reset,
                          output sum,Cout
                       );
                          

localparam S0 = 2'b00,S1 = 2'b01,S2 = 2'b10,S3 = 2'b11;
 
reg [1:0] present_state,next_state;

always @ (posedge clk)
begin
    if (reset)
        present_state <= S0;
    else
        present_state <=next_state;
end
 

  always @ (present_state,A,B)
begin
    case (present_state)
        S0:begin
            if (A == 1'b0 && B == 1'b0)
               next_state = S0;
            else if (A == 1'b1 && B == 1'b1)
               next_state = S2;
            else
               next_state = S1;
            end
        S1:
            if (A == 1'b0 && B == 1'b0)
               next_state = S0;
            else if (A == 1'b1 && B == 1'b1)
               next_state = S2;
            else
               next_state = S1;
        S2:
            if (A == 1'b0 && B == 1'b0)
               next_state = S1;
            else if (A == 1'b1 && B == 1'b1)
               next_state = S3;
            else
               next_state = S2;
        S3:
            if (A == 1'b0 && B == 1'b0)
               next_state = S1 ;
            else if (A == 1'b1 && B == 1'b1)
               next_state = S3;
            else
               next_state = S2;
        default: next_state = S0;
    endcase
end
 

assign sum = (present_state == S1 || present_state == S3) ? 1'b1 : 1'b0;
assign Cout = (present_state == S2 || present_state == S3) ? 1'b1 : 1'b0;
 
endmodule