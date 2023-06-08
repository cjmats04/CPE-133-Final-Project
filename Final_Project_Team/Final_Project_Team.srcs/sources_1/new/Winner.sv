`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michael Drobeck
// 
// Create Date: 06/05/2023 06:37:00 PM
// Design Name: 
// Module Name: Winner
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


module Winner(
    input [3:0] P1TTLSCR,
    input [3:0] P2TTLSCR,
    output WinnerLEDP1,
    output WinnerLEDP2
    );
    
    assign WinnerLEDP1 = (P1TTLSCR[3]|~P1TTLSCR[2]|P1TTLSCR[1]|~P1TTLSCR[0]);
    assign WinnerLEDP2 = (P2TTLSCR[3]|~P2TTLSCR[2]|P2TTLSCR[1]|~P2TTLSCR[0]);
    
endmodule
