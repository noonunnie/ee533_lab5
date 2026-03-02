///////////////////////////////////////////////////////////////////////////////
// Module: pipeline.v
// Project: NF2.1
// Description: Wrapper for pipelined processor with register interface
//              Provides software/hardware register interface for processor control
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

// based off of ids.v beginning
module pipeline
   #(
      parameter DATA_WIDTH = 64,
      parameter CTRL_WIDTH = DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2
   )
   (
      // --- data path interface (pass-through)
      input  [DATA_WIDTH-1:0]            in_data,
      input  [CTRL_WIDTH-1:0]            in_ctrl,
      input                             in_wr,
      output                            in_rdy,

      output [DATA_WIDTH-1:0]            out_data,
      output [CTRL_WIDTH-1:0]            out_ctrl,
      output                            out_wr,
      input                             out_rdy,

      // --- Register interface
      input                               reg_req_in,
      input                               reg_ack_in,
      input                               reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

      output                              reg_req_out,
      output                              reg_ack_out,
      output                              reg_rd_wr_L_out,
      output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out,

      // misc
      input                               reset,
      input                               clk
   );

   //------------------------- Signals-------------------------------
   // Pipeline software registers
   wire [31:0]                   dmem_data_lo;
   wire [31:0]                   dmem_data_hi;
   wire [31:0]                   dmem_addr;
   wire [31:0]                   imem_addr;
   wire [31:0]                   pipeline_c;   // PC set: bits [7:0] = value, bit [8] = load strobe

   // Pipeline hardware registers
   reg [31:0]                    imem_out;
   wire [7:0]                    host_pc_current;

   // Internal control
   reg [31:0]                    inst_write_data;
   reg                           inst_wr_en;
   reg [31:0]                    imem_addr_prev;

   // 2/18/26 LAB5 UPDATE: this brings our schematic design into our wrapper

   PipelinedDatapath processor_inst (
      .clk(clk),
      .InstData(inst_write_data),
      .rst(reset),
      .wea(inst_wr_en),
      .host_inst_addr(imem_addr[7:0]),
      .host_pc_load(pipeline_c[8]),
      .host_pc_value(pipeline_c[7:0]),
      .host_pc_current(host_pc_current)
   );

   // from ids.v

   generic_regs
   #(
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`PIPELINE_BLOCK_ADDR),
      .REG_ADDR_WIDTH      (`PIPELINE_REG_ADDR_WIDTH),
      .NUM_COUNTERS        (0),
      .NUM_SOFTWARE_REGS   (5),
      .NUM_HARDWARE_REGS   (2)
   ) pipeline_regs (
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),

      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),

      .counter_updates  (),
      .counter_decrement(),

      .software_regs    ({imem_addr, dmem_addr, dmem_data_hi, dmem_data_lo, pipeline_c}),
      .hardware_regs    ({imem_out, 24'b0, host_pc_current}),

      .clk              (clk),
      .reset            (reset)
   );

   // Treat an IMEM address update as an instruction write strobe.
   // aka: lets you write in instructions
   always @(posedge clk) begin
      if (reset) begin
         inst_write_data <= 32'h0;
         inst_wr_en <= 1'b0;
         imem_addr_prev <= 32'h0;
         imem_out <= 32'h0;
      end else begin
         inst_wr_en <= 1'b0;
         if (imem_addr != imem_addr_prev) begin
            inst_write_data <= dmem_data_lo;
            inst_wr_en <= 1'b1;
            imem_out <= dmem_data_lo;
            imem_addr_prev <= imem_addr;
         end
      end
   end

   // Separate from router
   assign out_data = in_data;
   assign out_ctrl = in_ctrl;
   assign out_wr = in_wr;
   assign in_rdy = out_rdy;

endmodule

