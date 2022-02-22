`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Macquarie University
// Engineer: 
// 
// Create Date: 01.10.2021 16:34:37
// Design Name: Four Digit Counter for Basys 3
// Module Name: counter1
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

module counter1(input clk, output Q);
        reg[17:0] count = 0;
        reg Q = 0;
    // insert your counter1 code here
    always @ (posedge clk) begin
        if(count == 18'd125000)begin
             Q = ~Q;
             count=0;
        end 
        else begin
                count = count+1;
        end
    end
endmodule
