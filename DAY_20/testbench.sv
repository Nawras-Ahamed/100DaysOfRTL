`timescale 10ns/1ps

module comparator_tb;

    
    reg [3:0] Din_A;
    reg [3:0] Din_B;

    
    wire less;
    wire equal;
    wire greater;

    
    comparator DUT (
        .Din_A(Din_A), 
        .Din_B(Din_B), 
        .less(less), 
        .equal(equal), 
        .greater(greater)
    );

    initial 
        begin
        Din_A = 10;
        Din_B = 12;
        #100;
            
        Din_A = 15;
        Din_B = 11;
        #100;
            
        Din_A = 10;
        Din_B = 10;
        #100;
    end
     
endmodule
