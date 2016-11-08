`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2016 05:14:24 PM
// Design Name: 
// Module Name: single_ff
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


module single_ff(
    input logic clk,
    input logic rst,
    input logic d,
    output logic q
    );
    
    // Positive edge Flip-flop with asynchronous reset
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            q       <= 1'b0;
        end
        else begin
            q       <= d;
        end
    end
    
endmodule
