`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
// Create Date: 09.09.2021 09:43:30
// Design Name: 
// Module Name: uart_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: UART Receiver
//      
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//      This code is a slight modification of the code from  
//      https://www.nandland.com/vhdl/modules/module-uart-serial-port-rs232.html. 
//		The functionality of the data_ready signal line was changed to reduce the number of 
// 		states needed in the state machine. The relationship between clock and baud rate has been
// 		hard coded. 
//      This is a very basic implementation of a UART receiver but it will suffice for our labs.
//      The UART transmitter baud rate should be set at 9600. There is no parity bit. Data_ready goes 
// 		HIGH when the received data is valid, and goes LOW when a start bit is detected or a reset is received.  
//
//////////////////////////////////////////////////////////////////////////////////

module uart_rx(input clk, input RsRx, input reset, 
    output data_ready, output [6:0] data);
  
  // define states
  parameter IDLE = 0, RX_START_BIT = 1, RX_DATA_BITS = 2, RX_STOP_BIT = 3;
  
  // CLKS_PER_BIT = 100 MHz Clock / 9600 UART baud rate
  parameter CLKS_PER_BIT = 10417;  
  
  // initialize internal registers
  reg rx_data1 = 1'b1; 
  reg rx_data0 = 1'b1;
  reg [15:0] clk_count = 0;
  reg [2:0] bit_index = 0; 
  reg [7:0] rx_data = 0;
  reg rx_data_ready = 0;
  reg [1:0] rx_state = IDLE;
  
  // Double-buffer incoming data to avoid instability issues
  always @(posedge clk)
    begin
      rx_data1 <= RsRx;
      rx_data0 <= rx_data1;
    end
   
  // Receiver state machine
  always @(posedge clk) begin
      if (reset) begin
          rx_state <= IDLE;
          rx_data = 0;
          rx_data_ready <= 1'b0;
      end
      else begin
          case (rx_state)
            IDLE: begin
                bit_index <= 0;
                clk_count <= 0;
                 
                if (rx_data0 == 1'b0) // Potential start bit detected
                  rx_state <= RX_START_BIT;
                else
                  rx_state <= IDLE;
            end
             
            RX_START_BIT: begin
                if (clk_count == (CLKS_PER_BIT-1)/2) begin
                    if (rx_data0 == 1'b0) begin // Check middle of start bit to make sure it's still low
                        rx_state <= RX_DATA_BITS;
                        clk_count <= 0;
                        rx_data_ready <= 1'b0;
                    end
                    else
                      rx_state <= IDLE;
                end
                else begin
                    rx_state <= RX_START_BIT;
                    clk_count <= clk_count + 1;
                end
            end 
             
            RX_DATA_BITS: begin
                if (clk_count < CLKS_PER_BIT-1) begin
                    rx_state <= RX_DATA_BITS;
                    clk_count <= clk_count + 1;
                end
                else begin
                    rx_data[bit_index] <= rx_data0;
                    clk_count <= 0;
                    if (bit_index < 7) begin // Check if all bits received
                        rx_state <= RX_DATA_BITS;
                        bit_index <= bit_index + 1;
                    end
                    else begin
                        rx_state <= RX_STOP_BIT;
                        bit_index <= 0;
                    end
                end
            end
         
            RX_STOP_BIT: begin
                if (clk_count < CLKS_PER_BIT-1) begin
                    rx_state <= RX_STOP_BIT;
                    clk_count <= clk_count + 1;
                end
                else begin
                    rx_state <= IDLE;
                    clk_count <= 0;
                    rx_data_ready <= 1'b1;
                end
            end
         
            default :
              rx_state <= IDLE;
             
          endcase
	  end
  end 
  
  // output combinational logic  
  assign data_ready = rx_data_ready;
  assign data = rx_data[6:0];

endmodule
