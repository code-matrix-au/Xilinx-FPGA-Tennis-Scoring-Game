`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Macquarie University
// Engineer: 
// 
// Create Date: 30.09.2021 14:43:24
// Design Name: Four Digit Counter for Basys 3
// Module Name: decoder
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

module decoder(input [1:0] S, output reg [3:0] AN);
    // insert your line decoder code here
    always @(S)begin
        case(S)
                2'b00 : AN = 4'b0111; 
                2'b01 : AN = 4'b1011; 
                2'b10 : AN = 4'b1101; 
                2'b11 : AN = 4'b1110; 

        endcase
    end

endmodule
