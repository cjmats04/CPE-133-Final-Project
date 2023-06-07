`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2023 06:47:53 PM
// Design Name: 
// Module Name: WARHLMOD
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


module WARHLMOD(
input clk,
input [3:0] A,
input [3:0] B,
input Enter,
output [7:0] SSEG1,
output [7:0] SSEG2,
output [3:0] AN1,
output [3:0] AN2,
output win_LEDP1,
output win_LEDP2

    );
   logic t1,t3,t5;
   logic [3:0] t2,t4,t6,t7;
    Accumulator ACCP1 (.clk(clk), .LD(t1), .CLR(t5), .D(t2), .Q(t6));
    Accumulator ACCP2 (.clk(clk), .LD(t3), .CLR(t5), .D(t4), .Q(t7));
    univ_sseg univ_ssegP1(.clk(clk), .cnt1({10'b0000000000,t6}), .valid(1), .ssegs(SSEG1), .disp_en(AN1));
     univ_sseg univ_ssegP2(.clk(clk), .cnt1({10'b0000000000,t7}), .valid(1), .ssegs(SSEG2), .disp_en(AN2));
     Winner winner (.P1TTLSCR(t6), .P2TTLSCR(t7), .WinnerLEDP1(win_LEDP1), .WinnerLEDP2(win_LEDP2) );
endmodule
