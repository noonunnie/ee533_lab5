`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module:    ProgCount
// Description:
//   64-bit program counter. On each clock: holds, increments, or loads a value.
//   Reset clears the PC to zero.
//   ProgCounter is the register holding the current program counter value that we check for debugging purposes
//////////////////////////////////////////////////////////////////////////////////

module ProgCount (
    input              clk,
    input              rst,
    input              load_en,       // load next_pc when high
    input      [63:0]  next_pc,       // value to load when load_en
    output reg [63:0]  ProgCounter
);

    localparam PC_INCR = 64'd4;   // increment by 4 for word-addressed instructions

    always @(posedge clk) begin
        if (rst)
            ProgCounter <= 64'b0;
        else if (load_en)
            ProgCounter <= next_pc;
        else
            ProgCounter <= ProgCounter + PC_INCR;
            
    end

endmodule

//////////////////////////////////////////////////////////////////////////////////
// --- OLD CODE (commented out) - schematic-derived ---
// it used the ALU  module to increment the program counter
// it used reg64 to hold the program counter value
//////////////////////////////////////////////////////////////////////////////////
// `timescale 1ns / 1ps

// module ProgCount(clk, 
//                  oper, 
//                  ProgCounter);

//     input clk;
//     input [2:0] oper;
//    output [63:0] ProgCounter;
   
//    wire [63:0] XLXN_1;
//    wire XLXN_9;
//    wire [63:0] ProgCounter_DUMMY;
//
//    assign ProgCounter[63:0] = ProgCounter_DUMMY[63:0];
//    ALU64Bit XLXI_1 (.a(XLXN_1[63:0]),
//                    .amask(),
//                    .b(),
//                    .cin(XLXN_9),
//                    .op(oper[2:0]),
//                    .cout(),
//                    .res(ProgCounter_DUMMY[63:0]));
//    reg64 XLXI_2 (.clk(clk),
//                 .data_in(ProgCounter_DUMMY[63:0]),
//                 .en(XLXN_9),
//                 .data_out(XLXN_1[63:0]));
//    VCC XLXI_4 (.P(XLXN_9));
// endmodule
