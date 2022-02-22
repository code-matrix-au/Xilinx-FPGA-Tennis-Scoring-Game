`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 15:34:30
// Design Name: 
// Module Name: counter2_tb
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


module counter2_tb();

reg clk = 0;
wire [1:0] q;

counter2 UUT(clk,q);

initial begin
forever begin
clk =~clk; #50;
end
end 

endmodule
