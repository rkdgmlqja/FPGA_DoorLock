`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2023 01:39:29 PM
// Design Name: 
// Module Name: led
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


module led(
input rst_n,
input clk,
input led_in,
output reg led0,
output reg led1,
output reg led2,
output reg led3
);

always@(posedge clk )begin
    if(!rst_n)begin
        led0<=1'b0;
        led1<=1'b0;
        led2<=1'b0;
        led3<=1'b0;
    end
    else if(led_in)begin
        led0<=1'b1;
        led1<=1'b1;
        led2<=1'b1;
        led3<=1'b1;
    end 
    else begin
        led0<=1'b0;
        led1<=1'b0;
        led2<=1'b0;
        led3<=1'b0;
    end
end

 
endmodule
