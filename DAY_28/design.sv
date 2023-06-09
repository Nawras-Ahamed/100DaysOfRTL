`timescale 1ns/1ps
module edge_detector( input wire signal,
                      input wire clk,
                      input reset,
                      output reg rising_edge,
                      output reg falling_edge
                    );
  
logic signal_delay;//internal reg for delaying the inpute signal by one clock and inverting it to and with the original signal
  
 always_ff @(posedge clk or posedge reset)
    begin
      if(reset)
        signal_delay = 1'b0;
      else
        signal_delay <= signal; //here the signal_delay is delayed exactly by one clk compareed to signal.
      
    end
  
  assign rising_edge = ~signal_delay & signal; // Rising edge when delayed signal is 0 but current is 1
  
  assign falling_edge = ~signal & signal_delay; // Falling edge when delayed signal is 1 but current is 0
  
endmodule
        