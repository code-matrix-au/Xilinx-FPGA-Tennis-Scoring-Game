`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2021 13:25:58
// Design Name: 
// Module Name: two_sec_timer_tb
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


module two_sec_timer_tb();
    
    reg clk = 0;
    reg start = 0;
    wire flag;
    
    two_sec_timer UUT(.clk(clk),.start(start),.flag(flag));
    
    initial begin
    forever begin
         clk = ~clk; #1;
    end
    end 
    initial begin
    start =1; #10000;
    start =0; #1;
    
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
