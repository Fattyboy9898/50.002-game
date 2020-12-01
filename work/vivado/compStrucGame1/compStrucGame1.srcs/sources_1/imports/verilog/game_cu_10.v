/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_cu_10 (
    input clk,
    input rst,
    input [0:0] button1,
    input [0:0] button2,
    input [15:0] regfile_data_in,
    input [0:0] st_easy,
    input [0:0] st_med,
    input [0:0] st_hard,
    input [0:0] st,
    input [0:0] rng_rdy,
    output reg decimal_counter_decrease,
    output reg decimal_counter_rst,
    output reg [5:0] alufn,
    output reg [2:0] asel,
    output reg [2:0] bsel,
    output reg [1:0] to_alufn,
    output reg [1:0] alufn_sel,
    output reg [5:0] regfile_write_address,
    output reg [5:0] regfile_read_address_a,
    output reg [5:0] regfile_read_address_b,
    output reg [5:0] regfile_read_address_o,
    output reg we,
    output reg wdsel,
    output reg [5:0] debug_state
  );
  
  
  
  localparam GAME_NOT_STARTED_game_fsm = 6'd0;
  localparam GAME_SET_LEVEL_0_game_fsm = 6'd1;
  localparam GAME_SET_TIMER_60_game_fsm = 6'd2;
  localparam GAME_WAIT_FOR_OPERAND1_game_fsm = 6'd3;
  localparam GAME_SET_OPERAND1_game_fsm = 6'd4;
  localparam GAME_WAIT_FOR_OPERAND2_game_fsm = 6'd5;
  localparam GAME_SET_OPERAND2_game_fsm = 6'd6;
  localparam GAME_COMPUTE_EXPECTED_ANS_game_fsm = 6'd7;
  localparam GAME_COMPUTE_MODULO_ANS_game_fsm = 6'd8;
  localparam GAME_MAIN_game_fsm = 6'd9;
  localparam GAME_TIMER_DECREASE_game_fsm = 6'd10;
  localparam GAME_TIMER_CHECK_game_fsm = 6'd11;
  localparam GAME_TIMER_BRANCH_game_fsm = 6'd12;
  localparam GAME_DIFFICULTY_CHECK_EASY_game_fsm = 6'd13;
  localparam GAME_DIFFICULTY_CHECK_MEDIUM_game_fsm = 6'd14;
  localparam GAME_DIFFICULTY_CHECK_HARD_game_fsm = 6'd15;
  localparam GAME_DIRECTION_CHECK_game_fsm = 6'd16;
  localparam GAME_DIRECTION_CHANGE_RIGHT_game_fsm = 6'd17;
  localparam GAME_DIRECTION_CHANGE_LEFT_game_fsm = 6'd18;
  localparam GAME_DIRECTION_SHIFT_LEFT_game_fsm = 6'd19;
  localparam GAME_DIRECTION_SHIFT_RIGHT_game_fsm = 6'd20;
  localparam GAME_DIRECTION_CHECK_0X1_game_fsm = 6'd21;
  localparam GAME_DIRECTION_CHECK_0X200_game_fsm = 6'd22;
  localparam GAME_ANSWER_CHECK_game_fsm = 6'd23;
  localparam GAME_ANSWER_INCREASE_SCORE_game_fsm = 6'd24;
  localparam GAME_ANSWER_DECREASE_SCORE_game_fsm = 6'd25;
  localparam GAME_ANSWER_CHECK_MORE_99_game_fsm = 6'd26;
  localparam GAME_ANSWER_SHOW_HUAT_game_fsm = 6'd27;
  localparam GAME_ANSWER_CHECK_SCORE_30_game_fsm = 6'd28;
  localparam GAME_ANSWER_CHANGE_HARD_DIFF_game_fsm = 6'd29;
  localparam GAME_ANSWER_CHECK_SCORE_20_game_fsm = 6'd30;
  localparam GAME_ANSWER_CHANGE_MED_DIFF_game_fsm = 6'd31;
  localparam GAME_ANSWER_CHANGE_EASY_DIFF_game_fsm = 6'd32;
  localparam GAME_OVER_game_fsm = 6'd33;
  localparam GAME_OVER_TIMER_SET_game_fsm = 6'd34;
  localparam GAME_OVER_TIMER_DECREASE_game_fsm = 6'd35;
  localparam GAME_OVER_TIMER_CHECK_game_fsm = 6'd36;
  localparam DEBUGGING_game_fsm = 6'd37;
  
  reg [5:0] M_game_fsm_d, M_game_fsm_q = GAME_NOT_STARTED_game_fsm;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    
    alufn = 1'h0;
    to_alufn = 1'h0;
    asel = 1'h0;
    bsel = 1'h0;
    regfile_write_address = 4'hc;
    regfile_read_address_a = 1'h0;
    regfile_read_address_b = 1'h0;
    regfile_read_address_o = 1'h0;
    we = 1'h0;
    wdsel = 1'h0;
    alufn_sel = 1'h0;
    debug_state = 1'h0;
    decimal_counter_decrease = 1'h0;
    decimal_counter_rst = 1'h0;
    if (rst) begin
      M_game_fsm_d = GAME_NOT_STARTED_game_fsm;
    end else begin
      
      case (M_game_fsm_q)
        GAME_NOT_STARTED_game_fsm: begin
          alufn_sel = 1'h0;
          we = 1'h0;
          debug_state = 6'h01;
          if (button1 == 1'h1) begin
            M_game_fsm_d = GAME_SET_LEVEL_0_game_fsm;
          end
        end
        GAME_SET_LEVEL_0_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h00;
          asel = 2'h1;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'h2;
          wdsel = 2'h0;
          debug_state = 6'h02;
          M_game_fsm_d = GAME_SET_TIMER_60_game_fsm;
        end
        GAME_SET_TIMER_60_game_fsm: begin
          alufn = 6'h00;
          we = 1'h1;
          regfile_write_address = 4'h6;
          wdsel = 2'h2;
          debug_state = 6'h03;
          M_game_fsm_d = DEBUGGING_game_fsm;
        end
        DEBUGGING_game_fsm: begin
          asel = 2'h1;
          bsel = 3'h0;
          regfile_read_address_b = 4'h6;
          regfile_read_address_a = 3'h5;
        end
        GAME_WAIT_FOR_OPERAND1_game_fsm: begin
          alufn_sel = 1'h0;
          asel = 1'h0;
          bsel = 1'h0;
          we = 1'h0;
          wdsel = 2'h0;
          debug_state = 6'h04;
          if (rng_rdy) begin
            M_game_fsm_d = GAME_SET_OPERAND1_game_fsm;
          end
        end
        GAME_SET_OPERAND1_game_fsm: begin
          alufn_sel = 1'h0;
          asel = 1'h0;
          bsel = 1'h0;
          we = 1'h1;
          regfile_write_address = 1'h0;
          wdsel = 2'h1;
          debug_state = 6'h05;
          M_game_fsm_d = GAME_WAIT_FOR_OPERAND2_game_fsm;
        end
        GAME_WAIT_FOR_OPERAND2_game_fsm: begin
          alufn_sel = 1'h0;
          asel = 1'h0;
          bsel = 1'h0;
          we = 1'h0;
          wdsel = 2'h0;
          debug_state = 6'h06;
          if (rng_rdy) begin
            M_game_fsm_d = GAME_SET_OPERAND2_game_fsm;
          end
        end
        GAME_SET_OPERAND2_game_fsm: begin
          alufn_sel = 1'h0;
          we = 1'h1;
          regfile_write_address = 1'h1;
          wdsel = 2'h1;
          debug_state = 6'h07;
          M_game_fsm_d = GAME_COMPUTE_EXPECTED_ANS_game_fsm;
        end
        GAME_COMPUTE_EXPECTED_ANS_game_fsm: begin
          alufn_sel = 1'h1;
          to_alufn = 2'h3;
          asel = 2'h0;
          bsel = 3'h0;
          we = 1'h1;
          wdsel = 2'h0;
          regfile_read_address_a = 4'h0;
          regfile_read_address_b = 4'h1;
          regfile_read_address_o = 4'h2;
          regfile_write_address = 4'h3;
          debug_state = 6'h08;
          M_game_fsm_d = GAME_COMPUTE_MODULO_ANS_game_fsm;
        end
        GAME_COMPUTE_MODULO_ANS_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h03;
          asel = 2'h0;
          bsel = 1'h1;
          we = 1'h1;
          regfile_read_address_a = 4'h3;
          regfile_write_address = 4'h4;
          wdsel = 2'h0;
          debug_state = 6'h09;
          M_game_fsm_d = GAME_MAIN_game_fsm;
        end
        GAME_MAIN_game_fsm: begin
          debug_state = 6'h0a;
          if (st == 1'h1) begin
            M_game_fsm_d = GAME_TIMER_DECREASE_game_fsm;
          end
        end
        GAME_ANSWER_CHECK_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h0;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_a = 4'h4;
          regfile_read_address_b = 4'h8;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          debug_state = 6'h0a;
          if (button1 == 1'h1) begin
            M_game_fsm_d = GAME_ANSWER_DECREASE_SCORE_game_fsm;
          end else begin
            M_game_fsm_d = GAME_ANSWER_DECREASE_SCORE_game_fsm;
          end
        end
        GAME_ANSWER_DECREASE_SCORE_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h01;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h5;
          regfile_write_address = 4'h5;
          wdsel = 2'h0;
          debug_state = 6'h0b;
          M_game_fsm_d = GAME_ANSWER_CHECK_MORE_99_game_fsm;
        end
        GAME_ANSWER_INCREASE_SCORE_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h00;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h5;
          regfile_write_address = 4'h5;
          wdsel = 2'h0;
          debug_state = 6'h0c;
          M_game_fsm_d = GAME_ANSWER_CHECK_MORE_99_game_fsm;
        end
        GAME_ANSWER_CHECK_MORE_99_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h3d;
          asel = 2'h0;
          bsel = 3'h6;
          we = 1'h1;
          regfile_read_address_a = 4'h5;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          debug_state = 6'h0d;
          if (1'h1) begin
            M_game_fsm_d = GAME_ANSWER_SHOW_HUAT_game_fsm;
          end else begin
            M_game_fsm_d = GAME_ANSWER_CHECK_SCORE_30_game_fsm;
          end
        end
        GAME_ANSWER_SHOW_HUAT_game_fsm: begin
          alufn_sel = 1'h0;
          we = 1'h0;
          debug_state = 6'h0b;
          M_game_fsm_d = GAME_MAIN_game_fsm;
        end
        GAME_ANSWER_CHECK_SCORE_20_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h3d;
          asel = 2'h0;
          bsel = 3'h3;
          we = 1'h1;
          regfile_read_address_a = 4'h5;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          if (1'h1) begin
            M_game_fsm_d = GAME_ANSWER_CHANGE_EASY_DIFF_game_fsm;
          end else begin
            M_game_fsm_d = GAME_ANSWER_CHECK_SCORE_30_game_fsm;
          end
        end
        GAME_ANSWER_CHECK_SCORE_30_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h1f;
          asel = 2'h0;
          bsel = 3'h2;
          we = 1'h1;
          regfile_read_address_a = 4'h5;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          if (1'h1) begin
            M_game_fsm_d = GAME_ANSWER_CHANGE_HARD_DIFF_game_fsm;
          end else begin
            M_game_fsm_d = GAME_ANSWER_CHANGE_MED_DIFF_game_fsm;
          end
        end
        GAME_ANSWER_CHANGE_HARD_DIFF_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h00;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'h2;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_MAIN_game_fsm;
        end
        GAME_ANSWER_CHANGE_MED_DIFF_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h00;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'h2;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_MAIN_game_fsm;
        end
        GAME_ANSWER_CHANGE_EASY_DIFF_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h00;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'h2;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_MAIN_game_fsm;
        end
        GAME_TIMER_DECREASE_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h01;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h6;
          regfile_write_address = 4'h6;
          wdsel = 2'h0;
          decimal_counter_decrease = $signed(2'h3);
          debug_state = 6'h38;
          M_game_fsm_d = GAME_TIMER_CHECK_game_fsm;
        end
        GAME_TIMER_CHECK_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h1;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h6;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          debug_state = 6'h39;
        end
        GAME_TIMER_BRANCH_game_fsm: begin
          regfile_read_address_b = 4'hf;
          debug_state = 6'h15;
          if (regfile_data_in == 4'h0) begin
            M_game_fsm_d = GAME_OVER_game_fsm;
          end else begin
            
          end
        end
        GAME_OVER_game_fsm: begin
          alufn_sel = 1'h0;
          we = 1'h0;
          debug_state = 6'h3f;
        end
        GAME_DIFFICULTY_CHECK_EASY_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h1;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_DIRECTION_CHECK_game_fsm;
        end
        GAME_DIFFICULTY_CHECK_MEDIUM_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_DIRECTION_CHECK_game_fsm;
        end
        GAME_DIFFICULTY_CHECK_HARD_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h3;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h2;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_DIRECTION_CHECK_game_fsm;
        end
        GAME_DIRECTION_CHECK_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h1;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h7;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          if (1'h1) begin
            M_game_fsm_d = GAME_DIRECTION_SHIFT_LEFT_game_fsm;
          end else begin
            M_game_fsm_d = GAME_DIRECTION_CHECK_0X1_game_fsm;
          end
        end
        GAME_DIRECTION_CHECK_0X1_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h8;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          if (1'h0) begin
            M_game_fsm_d = GAME_DIRECTION_CHANGE_LEFT_game_fsm;
          end else begin
            M_game_fsm_d = GAME_DIRECTION_SHIFT_RIGHT_game_fsm;
          end
        end
        GAME_DIRECTION_SHIFT_LEFT_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h20;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h8;
          regfile_write_address = 4'h8;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_DIRECTION_CHECK_0X200_game_fsm;
        end
        GAME_DIRECTION_SHIFT_RIGHT_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h21;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h8;
          regfile_write_address = 4'h8;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_MAIN_game_fsm;
        end
        GAME_DIRECTION_CHANGE_LEFT_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h00;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_a = 4'h7;
          regfile_write_address = 4'h7;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_DIRECTION_SHIFT_LEFT_game_fsm;
        end
        GAME_DIRECTION_CHECK_0X200_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h35;
          asel = 2'h0;
          bsel = 3'h4;
          we = 1'h1;
          regfile_read_address_a = 4'h8;
          regfile_write_address = 4'hf;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_DIRECTION_CHANGE_RIGHT_game_fsm;
        end
        GAME_DIRECTION_CHANGE_RIGHT_game_fsm: begin
          alufn_sel = 1'h0;
          alufn = 6'h00;
          asel = 2'h2;
          bsel = 3'h0;
          we = 1'h1;
          regfile_read_address_b = 4'h7;
          regfile_write_address = 4'h7;
          wdsel = 2'h0;
          M_game_fsm_d = GAME_MAIN_game_fsm;
        end
      endcase
    end
  end
  
  always @(posedge clk) begin
    M_game_fsm_q <= M_game_fsm_d;
  end
  
endmodule