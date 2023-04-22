// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module TB;

  reg a,b,c,d,s0,s1;
  wire out;
  integer i;
  
  MUX_4X1 DUT(.a(a),
              .b(b),
              .c(c),
              .d(d),
              .s0(s0),
              .s1(s1),
              .out(out));
  
  initial
    begin
      $dumpfile("waveform.vcd");
      $dumpvars;

      //set stimulus to test the code
      a <= $random;
      b <= $random;
      c <= $random;
      d <= $random;
      s0=1'b0; 
      s1=1'b0;
     #100 
          $finish;

end

  always #40 a=~a;
  always #20 b=~b;
  always #10 c=~c;
  always #5 d=~d;
  
  always #80 s0 = ~ s0;
  always #160 s1 = ~ s1;

  always@(*) 
    $monitor("At time = %t, Output = %d", $time, out);
  
endmodule