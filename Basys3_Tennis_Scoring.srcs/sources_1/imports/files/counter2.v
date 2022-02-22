`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Macquarie University 
// Engineer: 
// 
// Create Date: 01.10.2021 16:34:37
// Design Name: Four Digit Counter for Basys 3
// Module Name: counter2
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

module counter2(input clk, output [1:0] Q);
        
    // create a 2-bit counter with initial value of 0
    reg [1:0] count = 0;
    
    // increment on change of clk
    always @ (posedge clk)
        count <= count + 1;
    
    // provide 2-bit count as output
    assign Q = count; 
    
endmodule
