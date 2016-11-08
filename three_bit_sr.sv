`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2016 11:04:56 AM
// Design Name: 
// Module Name: three_bit_sr
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


module three_bit_sr (
    input data,
    input clk,
    input load,
    input [0:2] d,
    output [0:2] q
    );
    
    one_bit_sr sr0(.a(d[0]), .b(data), .load(load), .clk(clk), .c(q[0]));
    one_bit_sr sr1(.a(d[1]), .b(q[0]), .load(load), .clk(clk), .c(q[1]));
    one_bit_sr sr2(.a(d[2]), .b(q[1]), .load(load), .clk(clk), .c(q[2]));
    
endmodule
