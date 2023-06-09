`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michael Drobeck
// 
// Create Date: 06/07/2023 10:44:01 AM
// Design Name: 
// Module Name: Sim_Win_LED
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


module Sim_Win_LED;
logic [3:0] P1TTLSCR;
    logic [3:0] P2TTLSCR;
    logic WinnerLEDP1;
    logic WinnerLEDP2;
    
    Winner UUT(.P1TTLSCR(P1TTLSCR),.P2TTLSCR(P2TTLSCR),.WinnerLEDP1(WinnerLEDP1),.WinnerLEDP2(WinnerLEDP2));
    
    always begin
    #10
    P1TTLSCR = 3;
    P2TTLSCR = 0;
    #10
    P1TTLSCR = 0;
    P2TTLSCR = 0;
    #10    
    P1TTLSCR = 0;
    P2TTLSCR = 3;
    
    end
    
endmodule
