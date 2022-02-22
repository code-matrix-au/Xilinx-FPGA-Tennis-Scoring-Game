`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 14:50:23
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();

reg [5:0] a,b,c,d;
reg [1:0] s;
wire [5:0] out;

mux UUT(a,b,c,d,s,out);

initial begin

a = 6'b000000;
b = 6'b001100;
c = 6'b010010;
d = 6'b110011;

s = 2'b00; #250;
s = 2'b01;#250;
s = 2'b10;#250;
s = 2'b11;#250;

end
endmodule
