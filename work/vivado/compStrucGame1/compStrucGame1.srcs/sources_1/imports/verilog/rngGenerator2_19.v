/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module rngGenerator2_19 (
    input clk,
    input rst,
    output reg rng_ready,
    output reg [6:0] out
  );
  
  
  
  wire [1-1:0] M_slowclock_value;
  counter_20 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  
  wire [32-1:0] M_rng_num;
  reg [1-1:0] M_rng_next;
  reg [32-1:0] M_rng_seed;
  pn_gen_32 rng (
    .clk(clk),
    .rst(rst),
    .next(M_rng_next),
    .seed(M_rng_seed),
    .num(M_rng_num)
  );
  
  reg [6:0] check;
  
  always @* begin
    rng_ready = 1'h0;
    M_rng_next = M_slowclock_value;
    M_rng_seed = 32'hbeefdead;
    check = M_rng_num[0+6-:7];
    if (check <= 7'h63) begin
      out = check;
      rng_ready = 1'h1;
    end else begin
      out = 1'h0;
    end
  end
endmodule
