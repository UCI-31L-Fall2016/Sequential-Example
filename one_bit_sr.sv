`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2016 11:04:20 AM
// Design Name: 
// Module Name: one_bit_sr
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


module one_bit_sr(
        input logic a,
        input logic b,
        input logic load,
        input logic clk,
        output logic c
    );
    
    always @(posedge clk) begin
        if (load == 1'b1)
            c <= a;
        else
            c <= b;
    end
endmodule
