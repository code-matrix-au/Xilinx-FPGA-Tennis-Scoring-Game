`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2021 15:47:46
// Design Name: 
// Module Name: data_log_tb
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


module data_log_tb(

    );
    reg [6:0] datain;
    reg newdata;
    wire [3:0] command_out;
    
    
    data_log uut(datain,newdata, command_out);
    
    initial begin

    datain = 7'b1110100;#20;
    newdata = 1; #20;
    newdata = 0; #20;
    datain = 7'b0110001;#20;
    newdata = 1; #20;
    newdata = 0; #20;
    datain = 7'b0001101;#20;
    newdata = 1; #20;
    newdata = 0; #20;
    
    datain = 7'b1110100;#20;
    newdata = 1; #20;
    newdata = 0; #20;
    datain = 7'b0110010;#20;
    newdata = 1;#20;
    newdata = 0; #20;
    datain = 7'b0001101;#20;
    newdata = 1; #20;
    newdata = 0; #20;

    datain = 7'b0110001;#20;
    newdata = 1; #20;
    newdata = 0; #20;
    datain = 7'b0001101;#20;
    newdata = 1;#20;
    newdata = 0; #20;
    
    end 
endmodule
