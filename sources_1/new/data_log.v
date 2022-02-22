`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2021 14:44:46
// Design Name: 
// Module Name: data_log
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


module data_log(input [6:0] datain, input data_ready,  output reg [3:0] out);
parameter 
 r = 14'b11100100001101, 
t1 = 21'b111010001100010001101, 
t2 = 21'b111010001100100001101, 
 g = 14'b11001110001101,
s1 = 21'b111001101100010001101, 
s2 = 21'b111001101100100001101, 
s3 = 21'b111001101100110001101, 
one= 14'b01100010001101, 
two= 14'b01100100001101;          

reg [20:0] data;


always @(posedge data_ready)
    begin
    data = data << 7| datain;
    
    if(data[13:0] == r) out = 4'b0000;
    else if(data[20:0] == t1) out = 4'b0001;  
    else if(data[20:0] == t2) out = 4'b0010;
    else if(data[13:0] == g)  out = 4'b0011;
    else if(data[20:0] == s1) out = 4'b0100;
    else if(data[20:0] == s2) out = 4'b0101;
    else if(data[20:0] == s3) out = 4'b0110;
    else if(data[13:0] == one) out = 4'b0111;
    else if(data[13:0] == two) out = 4'b1000;
    else out = 4'b1111;
    end
endmodule
