////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : decode2b.vf
// /___/   /\     Timestamp : 02/17/2026 18:13:23
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/shared/SharedProjects/EE533Lab5-main/PipelinedDatapath/decode2b.sch decode2b.vf
//Design Name: decode2b
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module decode2b(addr, 
                out00, 
                out01, 
                out10, 
                out11);

    input [1:0] addr;
   output out00;
   output out01;
   output out10;
   output out11;
   
   wire XLXN_31;
   wire XLXN_34;
   
   INV XLXI_2 (.I(addr[0]), 
               .O(XLXN_31));
   INV XLXI_3 (.I(addr[1]), 
               .O(XLXN_34));
   AND2 XLXI_4 (.I0(XLXN_34), 
                .I1(XLXN_31), 
                .O(out00));
   AND2 XLXI_5 (.I0(addr[1]), 
                .I1(XLXN_31), 
                .O(out01));
   AND2 XLXI_6 (.I0(XLXN_34), 
                .I1(addr[0]), 
                .O(out10));
   AND2 XLXI_7 (.I0(addr[1]), 
                .I1(addr[0]), 
                .O(out11));
endmodule
