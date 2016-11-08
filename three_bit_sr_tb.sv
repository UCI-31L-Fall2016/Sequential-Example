`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2016 11:11:35 AM
// Design Name: 
// Module Name: three_bit_sr_tb
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


module three_bit_sr_tb;
    
    logic data;
    logic clk;
    logic load;
    logic [0:2] d;
    logic [0:2] q;
    int i;

    three_bit_sr DUT(
        .data(data),
        .clk(clk),
        .load(load),
        .d(d),
        .q(q)
    );
    
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        data = 1'b0;
        load = 1'b0;
        d = 3'b000;

        #30;
        // Load test
        for (i = 0; i < 8; i++) begin
            @(negedge clk); // update the input at negedge, and capture at posedge
            d = i;
            load = 1'b1;
            @(negedge clk); // load for a single cycle
            load = 1'b0;
            repeat(3)@(negedge clk);    // observe the value being shifted out
        end

        // Shift test
        for (i = 0; i < 8; i++) begin
            repeat(i) @(negedge clk);
            data = 1'b1;
            @(negedge clk);
            data = 1'b0;
        end

    end

endmodule
