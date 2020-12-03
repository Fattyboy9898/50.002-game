/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module led_level_8 (
    input clk,
    input rst,
    input [1:0] level,
    output reg out
  );
  
  
  
  wire [4-1:0] M_led_strip_pixel;
  wire [1-1:0] M_led_strip_led;
  reg [1-1:0] M_led_strip_update;
  reg [24-1:0] M_led_strip_color;
  ws2812b_writer_14 led_strip (
    .clk(clk),
    .rst(rst),
    .update(M_led_strip_update),
    .color(M_led_strip_color),
    .pixel(M_led_strip_pixel),
    .led(M_led_strip_led)
  );
  
  localparam LEDCOLOR0 = 312'hff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000;
  
  localparam LEDCOLOR1 = 312'h00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00;
  
  localparam LEDCOLOR2 = 312'h0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff;
  
  localparam LEDCOLOR3 = 312'h000000000000000000000000000000000000000000000000000000000000000000000000000000;
  
  always @* begin
    M_led_strip_color = 6'h00;
    if (level == 2'h0) begin
      M_led_strip_color = LEDCOLOR0[(M_led_strip_pixel)*24+23-:24];
    end else begin
      if (level == 2'h1) begin
        M_led_strip_color = LEDCOLOR1[(M_led_strip_pixel)*24+23-:24];
      end else begin
        if (level == 2'h2) begin
          M_led_strip_color = LEDCOLOR2[(M_led_strip_pixel)*24+23-:24];
        end else begin
          M_led_strip_color = LEDCOLOR3[(M_led_strip_pixel)*24+23-:24];
        end
      end
    end
    M_led_strip_update = 1'h1;
    out = M_led_strip_led;
  end
endmodule
