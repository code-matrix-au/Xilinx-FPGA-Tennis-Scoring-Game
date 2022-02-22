`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Macquarie University
// Engineer: 
// 
// Create Date: 01.10.2021 22:08:03
// Design Name: Four Digit Counter for Basys 3 
// Module Name: segcontroller
// Project Name: four_digit_counter 
// Target Devices: Artix-7
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


module segcontroller(input clk, input [5:0] A, input [5:0] B,
 input [5:0] C, input [5:0] D, input[3:0]dp_sel , 
 output wire [6:0] seg, output wire [3:0] an, output wire dp); 

	wire PQ;
	wire [1:0] DQ; 
	wire [5:0] m_out; 
    
    mux41 dp_select(dp_sel, DQ, dp);
	counter1 Counter1(clk, PQ);
	counter2 Counter2(PQ, DQ);
	mux Mux(A, B, C, D, DQ, m_out); 
	decoder Decoder(DQ, an);
	segdecoder segDecoder(m_out, seg);
        
endmodule
