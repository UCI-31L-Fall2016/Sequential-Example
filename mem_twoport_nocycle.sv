`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2016 01:08:18 PM
// Design Name: 
// Module Name: mem_twoport
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


module mem_twoport(
    input logic         clk,
    input logic [8:0]   ra,
    input logic [8:0]   wa,
    input logic         write,
    input logic [19:0]  d,
    output logic [19:0] q    
    );

    logic [19:0] mem [511:0];

    always_comb begin
        q = mem[ra];
    end

    always_ff @(posedge clk) begin
        if (write)
            mem[wa] <= d;
    end
endmodule
