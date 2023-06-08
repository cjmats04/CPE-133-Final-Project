`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Calvin Matsushita
// 
// Create Date: 06/05/2023 07:51:46 PM
// Design Name: Final Project - Team
// Module Name: FPT
// Project Name: CPE 133 Final Project
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


module FPT(
    input clk,
    input [3:0] FPT_A,
    input [3:0] FPT_B,
    input FPT_EN,
    input FPT_RST,
    output [7:0] FPT_SSEG,
    output [3:0] FPT_An,
    output [1:0] FPT_WLED
    );
    
    logic t1, t2, t3;
    logic [3:0] t4, t5;
    
    TK Turn_Keeper (.clk(clk), .TK_A(FPT_A), .TK_B(FPT_B), .TK_EN(FPT_EN), .TK_RST(FPT_RST), .TK_P1L(t1), .TK_P2L(t2), .TK_CLR(t3), .TK_S1(t4), .TK_S2(t5));
    Accumulator P1_Score (.clk(clk), .LD(t1), .CLR(t3), .D(4'b0001), .Q(t4));
    Accumulator P2_Score (.clk(clk), .LD(t2), .CLR(t3), .D(4'b0001), .Q(t5));
    univ_sseg sseg (.clk(clk), .cnt1({10'b0000000000, t4}), .cnt2({2'b00, t5}), .mod_sel(2'b01), .valid(1'b1), .ssegs(FPT_SSEG), .disp_en(FPT_An));
    Winner win1 (.P1TTLSCR(t4), .P2TTLSCR(t5), .WinnerLEDP1(FPT_WLED[0]), .WinnerLEDP2(FPT_WLED[1]));
endmodule
