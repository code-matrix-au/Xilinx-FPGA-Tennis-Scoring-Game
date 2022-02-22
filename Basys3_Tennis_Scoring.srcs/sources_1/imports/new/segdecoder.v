`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2021 19:01:11
// Design Name: 
// Module Name: segdecoder
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


module segdecoder(input [5:0] b, output [6:0] SEGMENT);
    
    reg [6:0] SEG;
    
    assign {SEGMENT[0],SEGMENT[1],SEGMENT[2],SEGMENT[3],
            SEGMENT[4],SEGMENT[5],SEGMENT[6]} = SEG;
    
    
always @(*)begin
    case(b)
        6'b000000: SEG = ~7'b1111110;//:0
        6'b000001: SEG = ~7'b0110000;//:1
        6'b000010: SEG = ~7'b1101101;//:2
        6'b000011: SEG = ~7'b1111001;//:3
        6'b000100: SEG = ~7'b0110011;//:4
        6'b000101: SEG = ~7'b1011011;//:5
        6'b000110: SEG = ~7'b1011111;//:6
        6'b000111: SEG = ~7'b1110000;//:7
        6'b001000: SEG = ~7'b1111111;//:8
        6'b001001: SEG = ~7'b1111011;//:9
        6'b001010: SEG = ~7'b1110111;//:A
        6'b001011: SEG = ~7'b1111101;//:a
        6'b001100: SEG = ~7'b0011111;//:b
        6'b001101: SEG = ~7'b1001110;//:C
        6'b001110: SEG = ~7'b0001101;//:c
        6'b001111: SEG = ~7'b0111101;//:d
        6'b010000: SEG = ~7'b1001111;//:E
        6'b010001: SEG = ~7'b1000111;//:F
        6'b010010: SEG = ~7'b1011110;//:G
        6'b010011: SEG = ~7'b0110111;//:H
        6'b010100: SEG = ~7'b0010111;//:h
        6'b010101: SEG = ~7'b0000110;//:I
        6'b010110: SEG = ~7'b0111100;//:j
        6'b010111: SEG = ~7'b0001110;//:L
        6'b011000: SEG = ~7'b0010101;//:n
        6'b011001: SEG = ~7'b1111110;//:O
        6'b011010: SEG = ~7'b0011101;//:o
        6'b011011: SEG = ~7'b1100111;//:P
        6'b011100: SEG = ~7'b1110011;//:q
        6'b011101: SEG = ~7'b0000101;//:r
        6'b011110: SEG = ~7'b1011011;//:S
        6'b011111: SEG = ~7'b0001111;//:t
        6'b100000: SEG = ~7'b0111110;//:U
        6'b100001: SEG = ~7'b0011100;//:u
        6'b100010: SEG = ~7'b0111011;//:y
        6'b100011: SEG = ~7'b0000000;//:space
    endcase

end
     
endmodule
