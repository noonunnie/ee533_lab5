`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date:    11:45:54 02/13/2026 
// Design Name: 		register_64bit 
// Module Name:    reg64 
// Project Name: reg_file
// Description:
//		On every positive clock edge, or when the reset signal transitions from high to low (active low reset), the module behaves as follows:
// 	If the reset signal is active (low), the output data data_out is set to all zeros.
// 	If the reset signal is active (high)
//			if enabled, the output data data_out is updated with the input data data_in
//			if not enabled, old value kept
//
// Revision: 
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////
//64 bit register with asynchronous,active low reset. Also write its testbench.
module reg64(input wire [64-1:0] data_in,
input wire clk,
input wire en,
output reg [64-1:0] data_out);


always@(posedge clk)begin 

if(en)begin
  data_out <= data_in;
end

end

endmodule