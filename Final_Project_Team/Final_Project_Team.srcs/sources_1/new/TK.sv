`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Calvin Matsushita
// 
// Create Date: 06/07/2023 09:39:09 AM
// Design Name: Turn Keeper FSM
// Module Name: TK
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


module TK(
    input clk,
    input [3:0] TK_A,
    input [3:0] TK_B,
    input TK_EN,
    input TK_RST,
    input [3:0] TK_S1,
    input [3:0] TK_S2,
    output logic TK_P1L,
    output logic TK_P2L,
    output logic TK_CLR
    );
    
    typedef enum {RST, P1_EN, P2_EN, P1_WAIT, P2_WAIT, P1_CHK, P2_CHK, P1_BF, P2_BF, WIN} STATES;
    STATES PS, NS;
    
    always_ff @(posedge clk, posedge TK_RST) begin
        if (TK_RST) begin
            PS <= RST;
        end
        else begin
            PS <= NS;
        end
    end
    
    always_comb begin
        case(PS)
            RST: begin //reset the module
                NS = P1_WAIT;
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b1;
            end
            P1_WAIT: begin //wait until P1 hits enter to move on
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                if (TK_EN) begin
                    NS = P1_BF;
                end
                else begin
                    NS = P1_WAIT;
                end   
            end
            P1_BF: begin //wait until P1 releases the enter button
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                if (~TK_EN) begin
                    NS = P1_EN;
                end
                else begin
                    NS = P1_BF;
                end   
            end
            P1_EN: begin //check if P1 scores a point after hitting enter
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                if (TK_A == TK_B) begin
                    TK_P1L = 1'b1;
                    NS = P1_CHK;
                end
                else begin
                    TK_P1L = 1'b0;
                    NS = P2_WAIT;    
                end
            end
            P1_CHK: begin //check to see if P1 won the game
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                if (TK_S1 == 3) begin
                    NS = WIN;
                end
                else begin
                    NS = P2_WAIT;
                end
            end
            P2_WAIT: begin //wait until P2 hits enter to move on
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                if (TK_EN) begin
                    NS = P2_BF;
                end
                else begin
                    NS = P2_WAIT;
                end   
            end
            P2_BF: begin //wait until P2 releases the enter button
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                if (~TK_EN) begin
                    NS = P2_EN;
                end
                else begin
                    NS = P2_BF;
                end   
            end
            P2_EN: begin //check if P1 scores a point after hitting enter
                TK_P1L = 1'b0;
                TK_CLR = 1'b0;
                if (TK_A == TK_B) begin
                    TK_P2L = 1'b1;
                    NS = P2_CHK;
                end
                else begin
                    TK_P2L = 1'b0;
                    NS = P1_WAIT;    
                end
            end
            P2_CHK: begin //check to see if P1 won the game
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                if (TK_S2 == 3) begin
                    NS = WIN;
                end
                else begin
                    NS = P1_WAIT;
                end
            end
            WIN: begin
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                NS = WIN;
            end
            default: begin
                TK_P1L = 1'b0;
                TK_P2L = 1'b0;
                TK_CLR = 1'b0;
                NS = RST;
            end
        endcase
    end
endmodule
