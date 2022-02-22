`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 16:05:27
// Design Name: 
// Module Name: segcontroller_tb
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


module segcontroller_tb();

reg clk=0;
reg [5:0] A,B,C,D;
reg [3:0] dp_sel;
wire [6:0] seg;
wire [3:0]an;
wire dp;

segcontroller UUT(clk,A,B,C,D,dp_sel,seg,an,dp);

initial begin
forever begin

clk=~clk; # 1;

end
end
initial begin

A = 6'b000000;
B = 6'b000001;
C = 6'b000010;
D = 6'b000011;
#3000000;
A = 6'b000111;
B = 6'b000101;
C = 6'b000110;
D = 6'b000100;
#3000000;
A = 6'b000101;
B = 6'b000111;
C = 6'b000000;
D = 6'b000010;
#3000000;
end

initial begin

dp_sel = 4'b1011; #5000000;
dp_sel = 4'b1110; #5000000;

end

endmodule
