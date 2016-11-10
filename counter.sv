`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2016 01:08:18 PM
// Design Name: 
// Module Name: counter
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

module counter (
    input logic clk,
    input logic reset,
    output logic [3:0] count);

    logic [3:0] temp;
    
always_ff @( posedge clk ) begin
    if ( reset ) begin
        temp <= 0;
    end else begin
        if ( temp == 10 ) begin
            temp <= 0;
        end else begin
            temp <= temp + 1;
        end
    end
end

assign count = temp;

endmodule