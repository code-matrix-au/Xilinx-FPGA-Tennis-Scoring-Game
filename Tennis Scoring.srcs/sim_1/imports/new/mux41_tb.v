`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 14:34:41
// Design Name: 
// Module Name: mux41_tb
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


module mux41_tb( );

wire out;
reg [3:0] in;
reg [1:0] s;

mux41 UUT(in, s, out);
        
initial begin

in = 4'b1110; 
s = 2'b00; #50;
s = 2'b01; #50;
s = 2'b10; #50;
s = 2'b11; #50;

in = 4'b0110; 
s = 2'b00; #50;
s = 2'b01; #50;
s = 2'b10; #50;
s = 2'b11; #50;

end
endmodule
