`timescale 10ns/1ps

module CLA_TB;
  reg [3:0]A, B; 
  reg Cin;
  wire [3:0] S;
  wire Cout;
  wire[4:0] add;
  
  CLA cla(A, B, Cin, S, Cout);
  
  assign add = {Cout, S};
  
  initial 
    begin 
      $dumpfile("waveform.vcd");
      $dumpvars;
    end 
  
  initial 
    begin
    $monitor("TIME = %d ns, A = %b, B = %b, Cin = %b --> S = %b, Cout = %b, Addition = %0d",$time, A, B, Cin, S, Cout, add);
        A = 1; B = 0; Cin = 0; #10;
        A = 2; B = 4; Cin = 1; #5;
        A = 4'hb; B = 4'h6; Cin = 0; #5;
        A = 5; B = 3; Cin = 1; #5
        A = 6;  B = 9;  Cin = 0;   #5; 
        A = 8;  B = 2;  Cin = 0;   #5;
        A = 8;  B = 2;  Cin = 1;   #5;
        A = 9;  B = 9;  Cin = 1;   #5;
  end
endmodule

