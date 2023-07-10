module Rom(
    input clk, r_en,
    input [3:0] addr,
    output reg [15:0] data
			);

reg [8:0] mem [64:0];

always@(posedge clk)
  begin
    if(r_en)
          data <= mem[addr];
    else
          data <= 8'bz;
  end

endmodule