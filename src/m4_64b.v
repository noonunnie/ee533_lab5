`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:17 02/13/2026 
// Design Name: 
// Module Name:    m4_64b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module m4_64b (
    input [63:0] d0,
    input [63:0] d1,
    input [63:0] d2,
    input [63:0] d3,
    input [1:0] s,     // 2-bit Select line
    output reg [63:0] o
    );

    always @(*) begin
		case (s)
			2'b00: o = d0;
			2'b01: o = d1;
			2'b10: o = d2;
			2'b11: o = d3;
		endcase
    end
endmodule
