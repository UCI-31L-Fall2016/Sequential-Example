`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2016 05:19:02 PM
// Design Name: 
// Module Name: single_ff_tb
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


module single_ff_tb;

logic clk;
logic rst;
logic d;
logic q;


single_ff DUT(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
    );

initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1'b1;
    #10 rst = 1'b0;
end

initial begin
    d = 1'b0;
    // Going to update the value on negedge clk, 
    //so that it can be captured by posedge later
    repeat(5)@(negedge clk);
    d = 1'b1;
    repeat(3)@(negedge clk);
    d = 1'b0;
end

endmodule
