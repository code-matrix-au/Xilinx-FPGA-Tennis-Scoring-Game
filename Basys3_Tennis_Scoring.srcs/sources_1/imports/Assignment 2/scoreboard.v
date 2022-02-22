`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Macquarie University
// Engineer: 
// 
// Create Date: 23.09.2021 10:36:44
// Design Name: 2021 S2 ELEC2042 Major Project
// Module Name: scoreboard
// Project Name: 
// Target Devices: Basys 3
// Tool Versions: 
// Description: Top level project template
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*
    Inputs:
        RsRx - UART input
        clk - clock signal
        
    Outputs:
        seg - 7-segment display elements, where seg[0] = CA, seg[1] = CB, etc.
        dp - decimal point
        an - 7-segment display control lines, where an[0] = AN0, an[1] = AN1, etc.
        RsTx - UART output  

*/
module scoreboard( input RsRx, input clk, output wire [6:0] 
    seg, output wire dp, output wire [3:0] an, output RsTx );

wire [5:0] A, B, C, D;
wire [3:0] dp_sel;
wire [3:0] uart_command;
wire data_ready;
wire [6:0] uart_data;


game_state game_state(clk, uart_command, A, B, C, D, dp_sel);
uart_rx(clk, RsRx, reset, data_ready, uart_data);
data_log(uart_data, data_ready, uart_command);

segcontroller segController(clk, A, B, C, D, dp_sel, seg, an, dp);



endmodule

