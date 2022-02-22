`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Macquarie University
// Engineer: 
// 
// Create Date: 30.09.2021 14:43:24
// Design Name: Four Digit Counter for Basys 3
// Module Name: mux41
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

module mux41(input [3:0] in, input [1:0] S, output out);
    
reg out1;
assign out = out1;
   
    always @(S) 
    begin
        case(S)
            2'b00 : out1 = in[0];
            2'b01 : out1 = in[1];
            2'b10 : out1 = in[2];
            2'b11 : out1 = in[3];

        endcase
    end
endmodule

    


