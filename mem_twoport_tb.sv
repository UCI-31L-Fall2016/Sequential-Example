`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2016 01:12:49 PM
// Design Name: 
// Module Name: mem_twoport_tb
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


module mem_twoport_tb;
    
    logic         clk;
    logic [8:0]   ra;
    logic [8:0]   wa;
    logic         write;
    logic [19:0]  d;
    logic [19:0] q;
    
    int i;

    mem_twoport DUT(
        .clk(clk),
        .ra(ra),
        .wa(wa),
        .write(write),
        .d(d),
        .q(q)
        );

    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        ra = 9'd0;
        wa = 9'd0;
        write = 1'b0;
        d = 19'd0;
        
        // Write test
        for (i = 0; i < 512; i++) begin
            @(negedge clk); // change input at negedge, capture at posedge
            wa = i;
            d = i + 'd512;
            write = 1'b1;
            @(negedge clk); // write for a single cycle
            write = 1'b0;
            repeat(3)@(negedge clk); // rest
        end

        // Read test
        for (i = 0; i < 512; i++) begin
            ra = i;
            repeat(3) @(negedge clk); // Rest
        end

    end



endmodule
