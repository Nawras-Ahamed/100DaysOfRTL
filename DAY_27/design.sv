module JK_FF (
  input clk, RST,
  input j,k,
  output reg q,
  output qb
  );
  
  always@(posedge clk or negedge RST) begin 
    if(!RST) 
      q <= 0;
    else begin
      case({j,k})
        2'b00: q <= q;   
        2'b01: q <= 1'b0;
        2'b10: q <= 1'b1; 
        2'b11: q <= ~q;  
      endcase
    end
  end
  assign qb = ~q;
endmodule

module updown_selector(input q, qb, 
                       input updown, 
                       output next_clk);
  
  assign next_clk = updown?qb:q;
  
endmodule

module updown_counter(
  input clk, RST,
  input j, k,
  input updown,
  output [3:0] q, qb
);
  
  wire [3:0] next_clk;
  
  JK_FF jk1(clk, RST, j, k, q[0], qb[0]);
  updown_selector ud1(q[0], qb[0], updown, next_clk[0]);
  
  JK_FF jk2(next_clk[0], RST, j, k, q[1], qb[1]);
  updown_selector ud2(q[1], qb[1], updown, next_clk[1]);
  
  JK_FF jk3(next_clk[1], RST, j, k, q[2], qb[2]);
  updown_selector ud3(q[2], qb[2], updown, next_clk[2]);
  
  JK_FF jk4(next_clk[2], RST, j, k, q[3], qb[3]);
endmodule
  