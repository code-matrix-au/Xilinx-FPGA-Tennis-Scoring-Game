`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 15:44:49
// Design Name: 
// Module Name: counter1_tb
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


module counter1_tb();

wire Q;
reg clk =0;

counter1 UUT(clk,Q);

initial begin
forever begin

clk=~clk; #1;

end
end

endmodule
