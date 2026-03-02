////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : reg_file.vf
// /___/   /\     Timestamp : 02/17/2026 18:13:30
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/shared/SharedProjects/EE533Lab5-main/PipelinedDatapath/reg_file.sch reg_file.vf
//**Note: Should be replaced with double clocked Block Memory
//Design Name: reg_file
//Device: virtex2p
//**Note: wrong device above. maybe we should regenerate this file from the schematic
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module reg_file(clk, 
                r0addr, 
                r1addr, 
                waddr, 
                wdata, 
                wena, 
                r0data, 
                r1data);

    input clk;
    input [1:0] r0addr;
    input [1:0] r1addr;
    input [1:0] waddr;
    input [63:0] wdata;
    input wena;
   output [63:0] r0data;
   output [63:0] r1data;
   
   wire waddr00;
   wire waddr01;
   wire waddr10;
   wire waddr11;
   wire XLXN_1;
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_4;
   wire [63:0] XLXN_77;
   wire [63:0] XLXN_78;
   wire [63:0] XLXN_79;
   wire [63:0] XLXN_80;
   
   reg64 XLXI_1 (.clk(clk), 
                 .data_in(wdata[63:0]), 
                 .en(XLXN_2), 
                 .data_out(XLXN_77[63:0]));
   reg64 XLXI_2 (.clk(clk), 
                 .data_in(wdata[63:0]), 
                 .en(XLXN_1), 
                 .data_out(XLXN_78[63:0]));
   reg64 XLXI_3 (.clk(clk), 
                 .data_in(wdata[63:0]), 
                 .en(XLXN_3), 
                 .data_out(XLXN_79[63:0]));
   reg64 XLXI_4 (.clk(clk), 
                 .data_in(wdata[63:0]), 
                 .en(XLXN_4), 
                 .data_out(XLXN_80[63:0]));
   decode2b XLXI_6 (.addr(waddr[1:0]), 
                    .out00(waddr00), 
                    .out01(waddr01), 
                    .out10(waddr10), 
                    .out11(waddr11));
   AND2 XLXI_11 (.I0(waddr01), 
                 .I1(wena), 
                 .O(XLXN_1));
   AND2 XLXI_12 (.I0(waddr00), 
                 .I1(wena), 
                 .O(XLXN_2));
   AND2 XLXI_13 (.I0(waddr10), 
                 .I1(wena), 
                 .O(XLXN_3));
   AND2 XLXI_14 (.I0(waddr11), 
                 .I1(wena), 
                 .O(XLXN_4));
   m4_64b XLXI_39 (.d0(XLXN_77[63:0]), 
                   .d1(XLXN_78[63:0]), 
                   .d2(XLXN_79[63:0]), 
                   .d3(XLXN_80[63:0]), 
                   .s(r1addr[1:0]), 
                   .o(r1data[63:0]));
   m4_64b XLXI_40 (.d0(XLXN_77[63:0]), 
                   .d1(XLXN_78[63:0]), 
                   .d2(XLXN_79[63:0]), 
                   .d3(XLXN_80[63:0]), 
                   .s(r0addr[1:0]), 
                   .o(r0data[63:0]));
endmodule
