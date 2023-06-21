module barrel_shifter(input [7:0] data_in,
                      input clear,lr,
                      input [2:0] n,
                      output reg [7:0] data_out
                     );
  
  
  always@(*)
    begin 
      if(clear)
        data_out = 0;
      else 
        begin
          if(lr)
          data_out = data_in << n;
          else
          data_out = data_in >> n;
        end
    end
endmodule 