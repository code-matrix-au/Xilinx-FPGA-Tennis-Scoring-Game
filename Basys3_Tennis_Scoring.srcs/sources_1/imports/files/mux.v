`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Macquarie University
// Engineer: 
// 
// Create Date: 30.09.2021 14:43:24
// Design Name: Four Digit Counter for Basys 3
// Module Name: mux
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


// create 4x4 multiplexer using mux41

module mux(input [5:0] A, input [5:0] B, input [5:0] C, 
        input [5:0] D, input [1:0] S, output [5:0] out);
        
    wire [5:0] mux_0;
    wire [5:0] mux_1;
    wire [5:0] mux_2;
    wire [5:0] mux_3;
    wire [5:0] mux_4;
    wire [5:0] mux_5;
  
    assign mux_0 ={A[0], B[0], C[0], D[0]};
    assign mux_1 ={A[1], B[1], C[1], D[1]};
    assign mux_2 ={A[2], B[2], C[2], D[2]};
    assign mux_3 ={A[3], B[3], C[3], D[3]};
    assign mux_4 ={A[4], B[4], C[4], D[4]};
    assign mux_5 ={A[5], B[5], C[5], D[5]};
    
    mux41 mux0(mux_0, S, out[0]);
    mux41 mux1(mux_1, S, out[1]);
    mux41 mux2(mux_2, S, out[2]);
    mux41 mux3(mux_3, S, out[3]);
    mux41 mux4(mux_4, S, out[4]);
    mux41 mux5(mux_5, S, out[5]);
    
endmodule
