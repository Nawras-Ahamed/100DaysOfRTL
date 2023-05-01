module rc_add_sub_TB;
  
  wire [3:0] S, Cout;
  reg [3:0] A, B;
  reg ctrl;
  
  rc_add_sub rcas(A, B, ctrl, S, Cout);
  
   initial 
     begin
       $dumpfile("waveform.vcd");
      $dumpvars;
    end
  
  initial 
    begin
      
      ctrl = 0; //add
     	 A = 1; B = 0;
      #3 A = 2; B = 4;
      #3 A = 4'hb; B = 4'h6;
      #3 A = 5; B = 3;
      
      
      ctrl = 1; //subtract
      	 A = 1; B = 0;
      #3 A = 2; B = 4;
      #3 A = 4'hf; B = 4'h6;
      #3 A = 5; B = 3;
      #3 $finish;
  end
  
endmodule
