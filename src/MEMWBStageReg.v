////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : MEMWBStageReg.vf
// /___/   /\     Timestamp : 02/17/2026 18:13:37
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/shared/SharedProjects/EE533Lab5-main/PipelinedDatapath/MEMWBStageReg.sch MEMWBStageReg.vf
//Design Name: MEMWBStageReg
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module MEMWBStageReg(clk, 
                     WDataI, 
                     WREG1I, 
                     WREI, 
                     WDataO, 
                     WREG1O, 
                     WREO);

    input clk;
    input [63:0] WDataI;
    input [1:0] WREG1I;
    input WREI;
   output [63:0] WDataO;
   output [1:0] WREG1O;
   output WREO;
   
   wire XLXN_17;
   
   FD XLXI_5 (.C(clk), 
              .D(WREI), 
              .Q(WREO));
   defparam XLXI_5.INIT = 1'b0;
   VCC XLXI_7 (.P(XLXN_17));
   reg64 XLXI_9 (.clk(clk), 
                 .data_in(WDataI[63:0]), 
                 .en(XLXN_17), 
                 .data_out(WDataO[63:0]));
   reg2 XLXI_11 (.clk(XLXN_17), 
                 .data_in(WREG1I[1:0]), 
                 .en(clk), 
                 .data_out(WREG1O[1:0]));
endmodule
