`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2021 16:43:34
// Design Name: 
// Module Name: two_sec_timer
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


module two_sec_timer(input clk, input start, output reg flag);
    reg[29:0] count = 0;
    reg counting = 0; 
always @ (posedge clk) 
begin
   if(counting == 1)begin
        count=count+1;
        //if(count >= 30'b1011111010111100001) // used for test bech to reduce time
        if(count >= 30'b10111110101111000010000000000)
        begin
            counting = 0;
            flag = 1;
            count =0;
        end
   end
end

always @(posedge start)
begin
    counting = 1;
    flag =0;
end


endmodule
