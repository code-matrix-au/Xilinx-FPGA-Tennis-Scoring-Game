`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2021 15:19:12
// Design Name: 
// Module Name: game_state_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module game_state(input clk, input[3:0]uart_command, output reg [5:0] A,  output reg [5:0] B, output reg [5:0] C,output reg [5:0] D, output reg [3:0]dp);

parameter
 r = 4'b0000, //**
t1 = 4'b0001, 
t2 = 4'b0010, 
 g = 4'b0011, 
s1 = 4'b0100, 
s2 = 4'b0101, 
s3 = 4'b0110, 
one = 4'b0111, 
two = 4'b1000, //***

dpL = 4'b1011, 
dpR = 4'b1110, 
dpN = 4'b1111,

 zero_D = 6'b000000,
  one_D = 6'b000001,
  two_D = 6'b000010,
three_D = 6'b000011,
 four_D = 6'b000100,
 five_D = 6'b000101,
  six_D = 6'b000110,
seven_D = 6'b000111,
eight_D = 6'b001000,
 nine_D = 6'b001001,
  big_A = 6'b001010,
small_a = 6'b001011,
small_b = 6'b001100,
  big_C = 6'b001101,
small_c = 6'b001110,
small_d = 6'b001111,
  big_E = 6'b010000,
  big_F = 6'b010001,
  big_G = 6'b010010,
  big_H = 6'b010011,
small_h = 6'b010100,
  big_I = 6'b010101,
small_j = 6'b010110,
  big_L = 6'b010111,
small_n = 6'b011000,
  big_O = 6'b011001,
small_o = 6'b011010,
  big_P = 6'b011011,
small_q = 6'b011100,
small_r = 6'b011101,
  big_S = 6'b011110,
small_t = 6'b011111,
  big_U = 6'b100000,
small_u = 6'b100001,
small_y = 6'b100010,
  space = 6'b100011,
// states ***************************************
 /*state_love = 4'b0000, 
   state_15 = 4'b0001,
   state_30 = 4'b0010,
   state_40 = 4'b0011,
state_deuce = 4'b0100,
 state_adin = 4'b0101,
state_adout = 4'b0110,
state_loose = 4'b0111,
  state_win = 4'b1000;
*/
//************************************************
state_reset = 4'b0000, 
 state_play = 4'b0001;




reg [3:0] present_state = 4'b0000, next_state;

reg [2:0] l_score, r_score;

reg serving;


always @(present_state)
begin
    case(present_state)
        state_reset: begin 
            l_score <= 2'b00;
            r_score <= 2'b00;
            dp <= dpN;
            dp <= dpN;
            if(uart_command == t1)begin 
                 serving=0;
                 next_state = state_play;
            end
            
            else if(uart_command == t2) begin
                  serving=1;
                  next_state = state_play;
            end
        end
            
            
    
        state_play: begin 
            if(uart_command == r) next_state <= state_reset;
            if(serving == 0) dp = dpL;
            else if(serving == 1) dp = dpR;
            
            if(uart_command == one && l_score < 3'b011)begin
            l_score = l_score + 1;
            end
            
            else if(uart_command == two  && r_score < 3'b011)begin
            r_score = r_score + 1;
            end
        end
    endcase
end
        
        
always @(r_score)
begin        
    case(r_score)
        3'b000: begin
              C = zero_D;
              D = zero_D;
        end
        3'b001: begin
              C = one_D;
              D = five_D;
        end
        3'b010: begin
              C = three_D;
              D = zero_D;
        end
        3'b011: begin
              C = four_D;
              D = zero_D;
        end
    endcase
   
end
        
        
always @(l_score)
begin
    case(l_score)
        3'b000: begin  
              A = zero_D;
              B = zero_D;
        end
        3'b001: begin
              A = one_D;
              B = five_D;
        end
        3'b010: begin
              A = three_D;
              B = zero_D;
        end
        3'b011: begin
              A = four_D;
              B = zero_D;
        end
    endcase
end
        
        
        
        
        

    
always @(uart_command)
    present_state <= next_state;

    
    


endmodule
