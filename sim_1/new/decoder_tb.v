`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 15:02:29
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();

reg [1:0] s;
wire [3:0] an;

decoder UUT(s,an);

initial begin
  s = 2'b00; #250;
  s = 2'b01; #250;
  s = 2'b10; #250;
  s = 2'b11; #250;
  
end
endmodule

